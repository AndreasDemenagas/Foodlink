//
//  FoodCategoryController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

class FoodCategoryController: UICollectionViewController {
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category?.name
        collectionView.backgroundColor = .backgroundWhite
    }
    
    
}
