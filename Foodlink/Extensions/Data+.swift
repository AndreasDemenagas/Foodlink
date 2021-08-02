//
//  Data+.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import Foundation

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
