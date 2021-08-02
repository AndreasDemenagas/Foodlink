//
//  ReusableView.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 1/8/21.
//

import Foundation

protocol ReuseableCell {
    static var id: String { get }
}

extension ReuseableCell {
    static var id: String {
        return String(describing: self)
    }
}
