//
//  UIViewFactory.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation
import UIKit

public final class UIViewFactory {
    
    public class func createUIView(backgroundColor: UIColor = .white)-> UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
