//
//  Category.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import Foundation

struct Category: Decodable {
    let id: String
    let name: String
    let imageUrlString: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case imageUrlString = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

struct CategoryResponse: Decodable {
    let categories: [Category]
}
