//
//  ReuseableTableViewCell.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation
import UIKit

public protocol ConfigurableView: AnyObject {
    func configure(with viewModel: Any)
}

public protocol ConfigurableTableViewCell: ConfigurableView {
    func setIndexPath(_ indexPath: IndexPath)
}

open class ReusableTableViewCell: UITableViewCell, ReusableView, ConfigurableTableViewCell {
    
    public var indexPath: IndexPath!
    
    override open func prepareForReuse() {
        super.prepareForReuse()
    }
    
    open func configure(with viewModel: Any) {
        fatalError("Configure with viewModel must be implemented.")
    }
    
    public func setIndexPath(_ indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}

// MARK: Reusable view
public protocol ReusableView: AnyObject {}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
