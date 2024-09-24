//
//  Colors.swift
//  BreakFast
//
//  Created by Kostya Lee on 23/09/24.
//

import Foundation
import UIKit

extension UIColor {
    enum Common {
        static let background = UIColor(named: "background")
        static let foreground = UIColor(named: "foreground")
    }
    
    enum Button {
        static let actionButton = UIColor(named: "actionButton")
    }
    
    enum Label {
        static let titleLabel = UIColor(named: "titleLabel")
        static let subtitleLabel = UIColor(named: "subtitleLabel")
    }
    
    enum Tint {
        static let carbs = UIColor(named: "carbs")
        static let fat = UIColor(named: "fat")
        static let protein = UIColor(named: "protein")
    }
}
