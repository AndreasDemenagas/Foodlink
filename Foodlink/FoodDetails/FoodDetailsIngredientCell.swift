//
//  FoodDetailsIngredientCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 6/8/21.
//

import UIKit

class FoodDetailsIngredientCell: UICollectionViewCell, ReuseableCell {
    
    private let ingredientImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    fileprivate let ingredientNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 14))
        lbl.textAlignment = .center
        return lbl
    }()
    
    var ingredientName: String? {
        didSet {
            ingredientNameLabel.text = ingredientName
            
            if let name = ingredientName?.replacingOccurrences(of: " ", with: "%20") {
                let urlString = "https://www.themealdb.com/images/ingredients/\(name).png"
                ingredientImageView.loadImage(from: urlString)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 7
        layer.masksToBounds = true
        
        addSubview(ingredientNameLabel)
        ingredientNameLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 4, bottom: 4, right: 4))
        
        addSubview(ingredientImageView)
        ingredientImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: ingredientNameLabel.topAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
