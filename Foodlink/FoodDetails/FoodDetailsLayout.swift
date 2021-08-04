//
//  FoodDetailsLayout.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 4/8/21.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    static func foodDetailsLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 2
            item.contentInsets.bottom = 12
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 4
            
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), elementKind: FoodDetailsController.foodDetailsHeaderId, alignment: .top)
            ]
            
            return section
        }
        
        return layout
    }
}
