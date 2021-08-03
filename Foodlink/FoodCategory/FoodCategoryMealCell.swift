//
//  FoodCategoryMealCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 3/8/21.
//

import UIKit

class FoodCategoryMealCell: UICollectionViewCell, ReuseableCell {
    
    fileprivate let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 14
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    fileprivate let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 16))
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    fileprivate let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var meal: Meal? {
        didSet {
            guard let meal = meal else { return }
            
            mealImageView.loadImage(from: meal.imageUrlString)
            nameLabel.text = meal.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mealImageView)
        mealImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: -24, bottom: 0, right: 0), size: .init(width: frame.width / 3, height: .zero))
        
        addSubview(separatorLine)
        separatorLine.anchor(top: nil, leading: mealImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: .zero, height: 1))
        
        addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: separatorLine.leadingAnchor, bottom: nil, trailing: trailingAnchor)
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
