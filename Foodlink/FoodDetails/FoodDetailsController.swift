//
//  FoodDetailsController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

class FoodDetailsController: UICollectionViewController {
    
    init() {
        let layout = UICollectionViewCompositionalLayout.foodDetailsLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let foodDetailsHeaderId = "foodDetailsHeaderId"
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = meal?.name
        navigationController?.navigationBar.prefersLargeTitles = false
        
        collectionView.backgroundColor = .backgroundWhite
        collectionView.register(FoodDetailsMealInfoCell.self, forCellWithReuseIdentifier: FoodDetailsMealInfoCell.id)
        collectionView.register(FoodDetailsHeader.self, forSupplementaryViewOfKind: FoodDetailsController.foodDetailsHeaderId, withReuseIdentifier: FoodDetailsHeader.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FoodDetailsMealInfoCell = collectionView.dequeueCell(for: indexPath)
        cell.meal = meal
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: FoodDetailsHeader = collectionView.dequeueCell(for: indexPath, headerFooter: true, kind: kind)
        header.urlString = meal?.imageUrlString
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}
