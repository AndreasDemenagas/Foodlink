//
//  UICollectionView+.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

extension UICollectionView {
    func dequeueCell<T: ReuseableCell>(for indexPath: IndexPath, headerFooter: Bool = false, kind: String? = nil) -> T {
        
        if headerFooter {
            guard let kind = kind else {
                fatalError("You must supply a kind for ReusableHeaderFooter views...")
            }
            let cell = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.id, for: indexPath)
            return cell as! T
        }
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: T.id, for: indexPath) as! T
        return cell
    }
}
