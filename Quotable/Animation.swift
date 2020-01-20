//
//  Animation.swift
//  WWKS
//
//  Created by Stephanie on 1/15/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import Foundation
import UIKit

//Button animation
    extension UIView {
        // Using CAMediaTimingFunction
        func shake(duration: TimeInterval = 0.5, values: [CGFloat]) {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = duration // You can set fix duration
            animation.values = values  // You can set fix values here also
            self.layer.add(animation, forKey: "shake")
        }
    }
