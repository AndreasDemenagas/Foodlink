//
//  FoodFeedController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 1/8/21.
//

import UIKit


class FoodFeedController: UICollectionViewController {
    
    static let categoriesHeaderElementKind = "categoriesHeaderElementKind"
    
    private let viewModel = FoodFeedViewModel()
    
    init() {
        let layout = UICollectionViewCompositionalLayout.foodFeedLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
       
        viewModel.fetchFoodData { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .backgroundWhite
        collectionView.register(FoodShowcaseCell.self, forCellWithReuseIdentifier: FoodShowcaseCell.id)
        collectionView.register(FoodCategoryCell.self, forCellWithReuseIdentifier: FoodCategoryCell.id)
        collectionView.register(FoodFeedHeaderCell.self, forSupplementaryViewOfKind: FoodFeedController.categoriesHeaderElementKind, withReuseIdentifier: FoodFeedHeaderCell.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let showcaseCell: FoodShowcaseCell = collectionView.dequeueCell(for: indexPath)
            if viewModel.featuredMeals.isEmpty {
                return showcaseCell
            }
            showcaseCell.meal = viewModel.featuredMeals[indexPath.item]
            return showcaseCell
        }
        
        let cell: FoodCategoryCell = collectionView.dequeueCell(for: indexPath)
        cell.category = viewModel.categories?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: FoodFeedHeaderCell = collectionView.dequeueCell(for: indexPath, headerFooter: true, kind: kind)
        header.title = "Categories"
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.featuredMeals.count
        }
        
        return viewModel.categories?.count ?? 4 > 12 ? 12 : viewModel.categories?.count ?? 4
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        
        let category = viewModel.categories?[indexPath.item]
        let categoryController = FoodCategoryController(collectionViewLayout: UICollectionViewFlowLayout())
        categoryController.category = category
        navigationController?.pushViewController(categoryController, animated: true)
    }
    
}
