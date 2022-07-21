//
//  UITableViewFactory.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation
import UIKit

public final class UITableViewFactory {
    
    public class func createUITableView(seperatorStyle: UITableViewCell.SeparatorStyle = .singleLine,
                                        estimateRowHeight: CGFloat = 44,
                                        showsVerticalScrollIndicator: Bool = false)-> UITableView{
        let tableView = UITableView()
        tableView.separatorStyle = seperatorStyle
        tableView.estimatedRowHeight = estimateRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
}
