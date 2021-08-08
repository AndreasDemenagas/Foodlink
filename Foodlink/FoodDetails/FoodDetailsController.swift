//
//  FoodDetailsController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

class FoodDetailsController: UICollectionViewController {
    
    let viewModel = FoodDetailsViewModel()
    
    init(mealId: String, mealName: String) {
        let layout = UICollectionViewCompositionalLayout.foodDetailsLayout()
        self.mealId = mealId
        super.init(collectionViewLayout: layout)
        
        fetchMealDetails()
        viewModel.mealName = mealName
    }
    
    fileprivate func fetchMealDetails() {
        viewModel.fetchMeal(with: mealId) {
            self.collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let foodDetailsHeaderId = "foodDetailsHeaderId"
    
    static let ingredientsHeaderId = "ingedientsHeaderId"
    
    var mealId: String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.mealName
        navigationController?.navigationBar.prefersLargeTitles = false
        
        collectionView.backgroundColor = .backgroundWhite
        collectionView.register(FoodDetailsMealInfoCell.self, forCellWithReuseIdentifier: FoodDetailsMealInfoCell.id)
        collectionView.register(FoodDetailsIngredientCell.self, forCellWithReuseIdentifier: FoodDetailsIngredientCell.id)
        
        collectionView.register(FoodDetailsHeader.self, forSupplementaryViewOfKind: FoodDetailsController.foodDetailsHeaderId, withReuseIdentifier: FoodDetailsHeader.id)
        collectionView.register(FoodFeedHeaderCell.self, forSupplementaryViewOfKind: FoodDetailsController.ingredientsHeaderId, withReuseIdentifier: FoodFeedHeaderCell.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell: FoodDetailsMealInfoCell = collectionView.dequeueCell(for: indexPath)
            cell.delegate = self
            cell.viewModel = viewModel
            return cell
        }
        
        let cell: FoodDetailsIngredientCell = collectionView.dequeueCell(for: indexPath)
        cell.ingredientName = viewModel.meal?.getIngredients()[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let header: FoodDetailsHeader = collectionView.dequeueCell(for: indexPath, headerFooter: true, kind: kind)
            header.viewModel = viewModel
            return header
        }
    
        let header: FoodFeedHeaderCell = collectionView.dequeueCell(for: indexPath, headerFooter: true, kind: kind)
        header.title = "Ingredients"
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return viewModel.meal?.getIngredients().count ?? 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension FoodDetailsController: InstructionButtonDelegate {
    
    func didTapViewInstructions() {
        let instructionsController = FoodDetailsIntructionsController(meal: viewModel.meal)
        
        navigationController?.pushViewController(instructionsController, animated: true)
    }
    
}
