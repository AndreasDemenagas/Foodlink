//
//  FoodFeedController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 1/8/21.
//

import UIKit

class FoodFeedController: UICollectionViewController {
    
    static let categoriesHeaderElementKind = "categoriesHeaderElementKind"
    
    private var categories: [Category]?
    
    private var featuredMeals = [Meal]()
    
    init() {
        let layout = UICollectionViewCompositionalLayout.foodFeedLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0.95)
        collectionView.register(FoodShowcaseCell.self, forCellWithReuseIdentifier: FoodShowcaseCell.id)
        collectionView.register(FoodCategoryCell.self, forCellWithReuseIdentifier: FoodCategoryCell.id)
        collectionView.register(FoodFeedHeaderCell.self, forSupplementaryViewOfKind: FoodFeedController.categoriesHeaderElementKind, withReuseIdentifier: FoodFeedHeaderCell.id)
        
        fetchFoodData()
    }
    
    fileprivate func fetchCategories(completion: @escaping () -> () ) {
        NetworkManager.shared.fetchCategories() { result in
            switch result {
            case .failure(let error):
                print("Error fetching categories \(error)")
            case .success(let response):
                self.categories = response.categories
                completion()
            }
        }
    }
    
    fileprivate func fetchFeaturesMeals(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchRandomMeal { result in
            switch result {
            case .failure(let error):
                print("Error fetching random meal: \(error)")
            case .success(let response):
                self.featuredMeals.append(response.meals[0])
                completion()
            }
        }
    }
    
    fileprivate func fetchFoodData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchCategories {
            dispatchGroup.leave()
        }
        
        for _ in 1...4 {
            dispatchGroup.enter()
            fetchFeaturesMeals {
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodShowcaseCell.id, for: indexPath) as! FoodShowcaseCell
            if featuredMeals.isEmpty {
                return cell
            }
            cell.meal = featuredMeals[indexPath.item]
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCell.id, for: indexPath) as! FoodCategoryCell
        cell.category = categories?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FoodFeedHeaderCell.id, for: indexPath) as! FoodFeedHeaderCell
        header.title = "Categories"
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        
        return categories?.count ?? 8
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}
