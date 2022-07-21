//
//  UILabelFactory.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation
import UIKit

public final class UILabelFactory {
    
    public class func createUILabel<T: UILabel>
        (with color: UIColor = .black,
         textStyle: AppTextStyle = .title1,
         fontWeight: AppFontWeight = .regular,
         alignment: NSTextAlignment = .left,
         numberOfLines: Int = 1,
         lineBreakMode: NSLineBreakMode = .byTruncatingTail,
         text: String? = nil,
         alpha: CGFloat = 1.0,
         adjustFontSize: Bool = false) -> T {
        let label = T()
        label.font = UIFont.appFont(forTextStyle: textStyle, weight: fontWeight)
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.text = text
        label.alpha = alpha
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = adjustFontSize
        return label
    }
}

