//
//  BackgroundColor.swift
//  WWKS
//
//  Created by Stephanie on 1/9/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import GameKit

struct BackgroundColorProvider {
    let colors = [
            UIColor(red: 66/255.0, green: 62/255.0, blue: 65/255.0, alpha: 1.0), //dark color
            UIColor(red: 227/255.0, green: 178/255.0, blue: 60/255.0, alpha: 1.0), //yellow color
            UIColor(red: 205/255.0, green: 139/255.0, blue: 118/255.0, alpha: 1.0), //salmon color
            UIColor(red: 183/255.0, green: 171/255.0, blue: 170/255.0, alpha: 1.0), //gray purple color
            UIColor(red: 169/255.0, green: 179/255.0, blue: 206/255.0, alpha: 1.0), //light blue color
            UIColor(red: 153/255.0, green: 120/255.0, blue: 143/255.0, alpha: 1.0), //pink color
            UIColor(red: 176/255.0, green: 46/255.0, blue: 12/255.0, alpha: 1.0), //red color
        ]
    
    func randomColor() -> UIColor {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: colors.count)
        return colors[randomNumber]
    }
}
