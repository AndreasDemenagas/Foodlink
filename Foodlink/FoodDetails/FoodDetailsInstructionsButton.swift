//
//  FoodDetailsInstructionsButton.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 4/8/21.
//

import UIKit

class FoodDetailsInstructionsButton: UIView {
    
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 16))
        return label
    }()
    
    init(imageName: String, title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 5
        
        self.imageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        self.imageView.tintColor = backgroundColor == .white ? .black : .white
        
        self.titleLabel.text = title
        self.titleLabel.textColor = backgroundColor == .white ? .black : .white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        
        addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
