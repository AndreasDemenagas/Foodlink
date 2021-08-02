//
//  FoodFeedController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 1/8/21.
//

import UIKit

class FoodFeedController: UICollectionViewController {
    
    static let categoriesHeaderElementKind = "categoriesHeaderElementKind"
    
    private var categories: [Category]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init() {
        let layout = UICollectionViewCompositionalLayout.foodFeedLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.register(FoodFeedHeaderCell.self, forSupplementaryViewOfKind: FoodFeedController.categoriesHeaderElementKind, withReuseIdentifier: FoodFeedHeaderCell.id)
        
        fetchFoodData()
    }
    
    fileprivate func fetchFoodData() {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        NetworkManager.shared.fetchCategories(urlString: urlString) { result in
            switch result {
            case .failure(let error):
                print("Error fetching categories \(error)")
            case .success(let response):
                self.categories = response.categories
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = .systemRed
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
