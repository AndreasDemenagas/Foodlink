//
//  FoodDetailsMealInfoCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 4/8/21.
//

import UIKit

class FoodDetailsMealInfoCell: UICollectionViewCell, ReuseableCell {
    
    var meal: DetailedMeal? {
        didSet {
            nameLabel.text = meal?.name
        }
    }
    
    fileprivate let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 20))
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    fileprivate let starImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "star"))
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(starImageView)
        starImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 16), size: .init(width: 33, height: 33))
        
        addSubview(nameLabel)
        nameLabel.anchor(top: starImageView.topAnchor, leading: leadingAnchor, bottom: nil, trailing: starImageView.leadingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
