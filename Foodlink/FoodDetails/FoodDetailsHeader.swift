//
//  FoodDetailsHeader.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 4/8/21.
//

import UIKit

class FoodDetailsHeader: UICollectionReusableView, ReuseableCell {
    
    var urlString: String? {
        didSet {
            guard let urlString = urlString else { return }
            mealImageView.loadImage(from: urlString)
        }
    }
    
    private let mealImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mealImageView)
        mealImageView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
