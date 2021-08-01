//
//  FoodFeedLayout.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 1/8/21.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    static func foodFeedLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 2
            item.contentInsets.bottom = 16
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .paging
            return section
        }
        
        return layout
    }
}
