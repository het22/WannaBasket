//
//  PlayerTableViewCell.swift
//  WannaBasket
//
//  Created by Het Song on 25/06/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet weak var hStack: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        layer.borderWidth = 1
        layer.borderColor = Constants.Color.Black.cgColor
        numberLabel.layer.borderWidth = 1
        numberLabel.layer.borderColor = Constants.Color.Black.cgColor
        selectionStyle = .none
    }
    
    func setup(home: Bool, name: String, number: Int, highlightColor: UIColor) {
        if !home {
            hStack.removeArrangedSubview(numberLabel)
            hStack.addArrangedSubview(numberLabel)
        }
        nameLabel.text = name
        numberLabel.text = "\(number)"
        numberLabel.backgroundColor = highlightColor
        self.highlightColor = highlightColor
    }
    
    var highlightColor: UIColor = Constants.Color.Black
    var isCustomHighlighted: Bool = false {
        didSet(oldVal) {
            if oldVal == isCustomHighlighted { return }
            nameLabel.backgroundColor = isCustomHighlighted ? highlightColor : Constants.Color.White
            nameLabel.textColor = isCustomHighlighted ? Constants.Color.White: Constants.Color.Black
//            numberLabel.textColor = newVal ? highlightColor : Constants.Color.White
//            numberLabel.backgroundColor = newVal ? Constants.Color.White : highlightColor
        }
    }
}
