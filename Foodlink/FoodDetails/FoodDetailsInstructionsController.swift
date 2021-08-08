//
//  FoodDetailsInstructionsController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 8/8/21.
//

import UIKit

class FoodDetailsInstructionTextCell: UITableViewCell, ReuseableCell {
    
    var meal: DetailedMeal? {
        didSet {
            instructionsTextView.text = meal?.getInstructionsText()
            instructionsTextView.setContentOffset(.zero, animated: true)
        }
    }
    
    fileprivate let instructionsTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 18))
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCell() {
        addSubview(instructionsTextView)
        
        instructionsTextView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 24, left: 16, bottom: 24, right: 16))
    }
}

class FoodDetailsIntructionsController: UITableViewController {
    
    var meal: DetailedMeal? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instructions"
        view.backgroundColor = .white
                
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        
    }
    
}
