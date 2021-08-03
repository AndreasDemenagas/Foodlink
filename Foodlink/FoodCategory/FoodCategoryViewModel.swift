//
//  FoodCategoryViewModel.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import Foundation

class FoodCategoryViewModel {
    
    var meals = [Meal]()
    
    func fetchMeals(for categoryName: String?, completion: @escaping () -> () ) {
        guard let name = categoryName else { return }
        
        NetworkManager.shared.fetchCategoryMeals(for: name) { result in
            switch result {
            case .failure(let error):
                print("Error fetching category meals, \(error)")
            case .success(let response):
                self.meals = response.meals
                completion()
            }
        }
    }
}
