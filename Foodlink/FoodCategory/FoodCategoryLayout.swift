//
//  FoodCategoryLayout.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    
    static func categoryListLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 2
            item.contentInsets.bottom = 12
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(75)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 16
            return section
        }
        
        return layout
    }
    
}
