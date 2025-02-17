//
//  MealTableViewCell.swift
//  Cafe
//
//  Created by Student on 17.02.25.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet private weak var mealImageView: UIImageView!
    
    @IBOutlet private weak var mealNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        mealImageView.layer.cornerRadius = mealImageView.layer.bounds.width / 2
    }
    func configure(with meal : Meal){
        let url = URL(string: meal.imageUrl)
        mealImageView.kf.indicatorType = .activity
        mealImageView.kf.setImage(with: url)
        mealNameLabel.text = meal.name
    }
}
