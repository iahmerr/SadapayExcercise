//
//  UIImage+Extension.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 22/07/2022.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
  func loadImage(with url: URL?, placeholder: UIImage? = nil, showsIndicator: Bool = false) {
    sd_imageIndicator = showsIndicator ? SDWebImageActivityIndicator.gray : nil
    sd_setImage(with: url, placeholderImage: placeholder)
  }
}
