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
            
            if section == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 12
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 4
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), elementKind: FoodDetailsController.foodDetailsHeaderId, alignment: .top)
                ]
                
                return section
            }
            
            let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 12
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(100)), subitems: [item])
            
            group.contentInsets.top = 4
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            
            section.contentInsets.leading = 16
            
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: FoodDetailsController.ingredientsHeaderId, alignment: .topLeading)
            ]
            
            return section
            
        }
        
        return layout
    }
}
