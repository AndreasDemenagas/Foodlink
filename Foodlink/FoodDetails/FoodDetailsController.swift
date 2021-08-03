//
//  FoodDetailsController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

class FoodDetailsController: UIViewController {
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = meal?.name
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .backgroundWhite
    }
    
}
