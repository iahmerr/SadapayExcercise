//
//  UIColor+Extension.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 22/07/2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static let color_white_black: UIColor = appColor(named: "color_white_black")!
    static let color_black_white: UIColor = appColor(named: "color_black_white")!
    static let color_cell_background: UIColor = appColor(named: "color_cell_background")!
    
    
    private static func appColor(named: String) -> UIColor?{
#if TARGET_INTERFACE_BUILDER
        return UIColor.systemGray
#else
        return UIColor(named: named)
#endif
    }
}
