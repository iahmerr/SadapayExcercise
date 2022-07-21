//
//  ShimmeringTableViewCellViewModel.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

protocol ShimmeringTableViewCellViewModelType {
    
}


final class ShimmeringTableViewCellViewModel: ShimmeringTableViewCellViewModelType, ReusableTableViewCellViewModelType{
    
    var reusableIdentifier: String { ShimmeringTableViewCell.reuseIdentifier }
}
