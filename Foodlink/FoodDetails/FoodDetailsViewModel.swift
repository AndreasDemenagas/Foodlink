//
//  FoodDetailsViewModel.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import Foundation

class FoodDetailsViewModel {
    
    var meal: Meal?
    
    func fetchMeal(with id: String, completion: @escaping () -> () ) {
        NetworkManager.shared.fetchMeal(with: id) { result in
            switch result {
            case .failure(let error):
                print("Failed to fetch meal \(error)")
            case .success(let response):
                self.meal = response.meals[0]
                completion()
            }
        }
    }

}

