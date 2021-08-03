//
//  FoodShowcaseCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import UIKit

class FoodShowcaseCell: UICollectionViewCell, ReuseableCell {
    
    var category: Category? {
        didSet {
            guard let category = category else { return }
            
            label.text = category.name
            imageView.loadImage(from: category.imageUrlString)
        }
    }
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 24))
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let imageView: UIImageView = {
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
    
    private var meal: Meal? {
        didSet {
            guard let meal = meal else  { return }
            
            imageView.loadImage(from: meal.imageUrlString)
            label.text = meal.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemOrange
        
        addSubview(imageView)
        imageView.fillSuperView()
        
        addSubview(shadeView)
        shadeView.fillSuperView()
        
        addSubview(label)
        label.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 6, bottom: 0, right: 6))
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        fetchRandomMeal()
    }
    
    fileprivate func fetchRandomMeal() {
        NetworkManager.shared.fetchRandomMeal { result in
            switch result {
            case .failure(let error):
                print("Error fetching random meal: \(error)")
            case .success(let response):
                self.meal = response.meals[0]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}
