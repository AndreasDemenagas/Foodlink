//
//  FoodShowcaseCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import UIKit

class FoodShowcaseCell: UICollectionViewCell, ReuseableCell {
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 24))
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let shadeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        return view
    }()
    
    var meal: Meal? {
        didSet {
            guard let meal = meal else { return }
            
            thumbnailImageView.loadImage(from: meal.imageUrlString)
            titleLabel.text = meal.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray
        
        addSubview(thumbnailImageView)
        thumbnailImageView.fillSuperView()
        
        addSubview(shadeView)
        shadeView.fillSuperView()
        
        addSubview(titleLabel)
        titleLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 6, bottom: 0, right: 6))
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
