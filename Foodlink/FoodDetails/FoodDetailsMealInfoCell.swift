//
//  FoodDetailsMealInfoCell.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 4/8/21.
//

import UIKit

class FoodDetailsMealInfoCell: UICollectionViewCell, ReuseableCell {
    
    var viewModel: FoodDetailsViewModel? {
        didSet {
            nameLabel.text = viewModel?.meal?.name
            categoryButtonLabel.setTitle(viewModel?.meal?.category ?? "", for: .normal)
            areaButtonLabel.setTitle(viewModel?.meal?.area ?? "", for: .normal)
            tagsLabel.text = viewModel?.meal?.getTagsString()
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
    
    fileprivate let categoryButtonLabel: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 15))
        btn.setTitleColor(.systemOrange, for: .normal)
        return btn
    }()
    
    fileprivate let areaButtonLabel: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 15))
        btn.setTitleColor(.systemGreen, for: .normal)
        return btn
    }()
    
    fileprivate let tagsLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 14))
        lbl.textColor = .systemGray2
        return lbl
    }()
    
    fileprivate let viewInstructionsButton = FoodDetailsInstructionsButton(imageName: "pencil", title: "View Instructions", backgroundColor: .systemBlue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(starImageView)
        starImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 16), size: .init(width: 33, height: 33))
        
        addSubview(nameLabel)
        nameLabel.anchor(top: starImageView.topAnchor, leading: leadingAnchor, bottom: nil, trailing: starImageView.leadingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        addSubview(categoryButtonLabel)
        categoryButtonLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 3, left: 0, bottom: 0, right: 0))
        
        addSubview(areaButtonLabel)
        areaButtonLabel.anchor(top: categoryButtonLabel.topAnchor, leading: categoryButtonLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        
        addSubview(viewInstructionsButton)
        viewInstructionsButton.anchor(top: categoryButtonLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: starImageView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: .zero, height: 30))
        
        addSubview(tagsLabel)
        tagsLabel.anchor(top: viewInstructionsButton.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
