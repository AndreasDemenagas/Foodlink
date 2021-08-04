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
    
    var mealId: String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.mealName
        navigationController?.navigationBar.prefersLargeTitles = false
        
        collectionView.backgroundColor = .backgroundWhite
        collectionView.register(FoodDetailsMealInfoCell.self, forCellWithReuseIdentifier: FoodDetailsMealInfoCell.id)
        collectionView.register(FoodDetailsHeader.self, forSupplementaryViewOfKind: FoodDetailsController.foodDetailsHeaderId, withReuseIdentifier: FoodDetailsHeader.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FoodDetailsMealInfoCell = collectionView.dequeueCell(for: indexPath)
        cell.viewModel = viewModel
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: FoodDetailsHeader = collectionView.dequeueCell(for: indexPath, headerFooter: true, kind: kind)
        header.viewModel = viewModel
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}
