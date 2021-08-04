//
//  DetailedMeal.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 4/8/21.
//

import Foundation

struct DetailedMeal: Decodable, Hashable {
    let id: String
    let name: String
    let imageUrlString: String
    let category: String
    let area: String
    let instructions: String
    let tagsString: String?
    let youtubeUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrlString = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case tagsString = "strTags"
        case youtubeUrlString = "strYoutube"
    }
    
    func getTags() -> [String] {
        return self.tagsString?.components(separatedBy: ",") ?? []
    }
    
    func getTagsString() -> String {
        var text = "Tags: "
        
        for tag in getTags() {
            text.append("\(tag), ")
        }
        
        
        return String(String(text.dropLast()).dropLast())
    }
}

struct DetailedMealResponse: Decodable {
    let meals: [DetailedMeal]
}
