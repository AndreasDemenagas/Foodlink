//
//  FoodCategoryController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

class FoodCategoryController: UICollectionViewController {
    
    var category: Category?
    
    private let viewModel = FoodCategoryViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Meal>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, Meal>!
    
    init() {
        let layout = UICollectionViewCompositionalLayout.categoryListLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category?.name
        collectionView.backgroundColor = .backgroundWhite
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        
        viewModel.fetchMeals(for: category?.name) {
            self.snapshot = NSDiffableDataSourceSnapshot<Section, Meal>()
            self.snapshot.appendSections([.main])
            self.snapshot.appendItems(self.viewModel.meals, toSection: .main)
            self.dataSource.apply(self.snapshot, animatingDifferences: false)
        }
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Meal> { (cell, indexPath, meal) in
                    
            // Define how data should be shown using content configuration
            var content = cell.defaultContentConfiguration()
            content.text = meal.name
            
            // Assign content configuration to cell
            cell.contentConfiguration = content
       }
        
       dataSource = UICollectionViewDiffableDataSource<Section, Meal>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Meal) -> UICollectionViewCell? in
            // Dequeue reusable cell using cell registration (Reuse identifier no longer needed)
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
            return cell
        }
        
    }
    
}
