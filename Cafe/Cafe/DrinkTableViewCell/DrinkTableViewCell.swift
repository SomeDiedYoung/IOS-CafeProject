//
//  DrinkTableViewCell.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import UIKit
import Kingfisher

class DrinkTableViewCell: UITableViewCell {

    @IBOutlet private weak var drinkNameLabel: UILabel!
    
    @IBOutlet private weak var drinkImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        drinkImageView.layer.cornerRadius =
        drinkImageView.layer.bounds.width/2
    }

    
    func configure(with drink : Drink){
        let url = URL(string: drink.imageUrl)
        drinkImageView.kf.indicatorType = .activity
        drinkImageView.kf.setImage(with: url)
        drinkNameLabel.text = drink.name
        //I`m cooked
    }
    
}
