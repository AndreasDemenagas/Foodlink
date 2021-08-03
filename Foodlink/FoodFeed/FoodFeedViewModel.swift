//
//  FoodFeedViewModel.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import Foundation

class FoodFeedViewModel {
    
    var categories: [Category]?
    
    var featuredMeals = [Meal]()

    fileprivate func fetchCategories(completion: @escaping () -> () ) {
        NetworkManager.shared.fetchCategories() { result in
            switch result {
            case .failure(let error):
                print("Error fetching categories \(error)")
            case .success(let response):
                self.categories = response.categories
                completion()
            }
        }
    }
    
    fileprivate func fetchFeaturesMeals(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchRandomMeal { result in
            switch result {
            case .failure(let error):
                print("Error fetching random meal: \(error)")
            case .success(let response):
                self.featuredMeals.append(response.meals[0])
                completion()
            }
        }
    }
    
    func fetchFoodData(completion: @escaping () -> () ) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchCategories {
            dispatchGroup.leave()
        }
        
        for _ in 1...4 {
            dispatchGroup.enter()
            fetchFeaturesMeals {
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
    
}
