//
//  NetworkManager.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    
    func fetchMeal(with id: String, completion: @escaping (Result<DetailedMealResponse, Error>) -> () ) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchCategoryMeals(for category: String, completion: @escaping (Result<MealResponse, Error>) -> () ) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchRandomMeal(completion: @escaping (Result<MealResponse, Error>) -> () ) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchCategories(completion: @escaping (Result<CategoryResponse, Error>) -> () ) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        fetchData(urlString: urlString, completion: completion)
    }
    
    fileprivate func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> () ) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            guard let data = data else { return }
            
            do {
                let decoded: T = try data.decoded()
                
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
    
}
