//
//  Meal.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import Foundation

struct Meal: Decodable {
    let id: String
    let name: String
    let imageUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrlString = "strMealThumb"
    }
}

struct MealResponse: Decodable {
    let meals: [Meal]
}
