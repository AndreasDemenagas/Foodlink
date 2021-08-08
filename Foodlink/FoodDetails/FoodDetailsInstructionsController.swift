//
//  FoodDetailsInstructionsController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 8/8/21.
//

import UIKit

class FoodDetailsIntructionsController: UITableViewController {
    
    var meal: DetailedMeal?
    
    init(meal: DetailedMeal?) {
        self.meal = meal
        
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instructions"
        view.backgroundColor = .white
                
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.register(FoodDetailsInstructionTextCell.self, forCellReuseIdentifier: FoodDetailsInstructionTextCell.id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodDetailsInstructionTextCell.id, for: indexPath) as! FoodDetailsInstructionTextCell
        cell.meal = meal
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let text = meal?.getInstructionsText() else {
            return 10
        }
        
        let rect = NSString(string: text).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil)
        let imageViewHeight = view.frame.width * 0.56
        let cellHeight = imageViewHeight + 40 + 20 + 20 + rect.height + 20
        return cellHeight
    }
    
}
