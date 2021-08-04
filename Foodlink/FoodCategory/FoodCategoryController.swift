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
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Meal>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, Meal>!
    
    init() {
        let layout = UICollectionViewCompositionalLayout.categoryListLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category?.name
        collectionView.backgroundColor = .backgroundWhite
        collectionView.register(FoodCategoryMealCell.self, forCellWithReuseIdentifier: FoodCategoryMealCell.id)
        
        setupDataSource()
        
        viewModel.fetchMeals(for: category?.name) { [weak self] in
            self?.createSnapshot(with: self?.viewModel.meals ?? [])
        }
    }
    
    fileprivate func createSnapshot(with: [Meal]) {
        self.snapshot = NSDiffableDataSourceSnapshot<Section, Meal>()
        self.snapshot.appendSections([.main])
        self.snapshot.appendItems(self.viewModel.meals, toSection: .main)
        self.dataSource.apply(self.snapshot, animatingDifferences: false)
    }
    
    fileprivate func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Meal>(collectionView: collectionView, cellProvider: { collectionView, indexPath, meal in
            let cell: FoodCategoryMealCell = collectionView.dequeueCell(for: indexPath)
            cell.meal = meal
            
            return cell
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMeal = snapshot.itemIdentifiers[indexPath.item]
        let mealDetailsController = FoodDetailsController()
        mealDetailsController.meal = selectedMeal
        navigationController?.pushViewController(mealDetailsController, animated: true)
    }
    
}
