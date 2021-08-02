//
//  FoodCategoryCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import UIKit

class FoodCategoryCell: UICollectionViewCell, ReuseableCell {
    
    var category: Category? {
        didSet {
            guard let category = category else {
                return
            }
            
            label.text = category.name
            imageView.loadImage(from: category.imageUrlString)
        }
    }
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 14))
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperView()
        
        addSubview(label)
        label.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 4, bottom: 4, right: 4))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
