//
//  HabitTableViewCell.swift
//  Habit
//
//  Created by Lovina on 1/3/20.
//  Copyright © 2020 Buildschool. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var habitLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(habit: Habit) {
        iconImageView.image = habit.icon
        habitLabel.text = habit.text
        countLabel.text = String(habit.count)
    }
}
