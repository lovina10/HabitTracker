//
//  Habit.swift
//  Habit
//
//  Created by Lovina on 1/3/20.
//  Copyright © 2020 Buildschool. All rights reserved.
//

import UIKit

class Habit: NSObject {
    var text: String
    var count: Int
    var icon: UIImage

    init(text: String, count: Int, icon: UIImage) {
        self.text = text
        self.count = count
        self.icon = icon
    }
}
