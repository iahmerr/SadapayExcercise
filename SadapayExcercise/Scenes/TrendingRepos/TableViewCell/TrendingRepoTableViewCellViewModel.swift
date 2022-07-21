//
//  TrendingRepoTableViewCellViewModel.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

protocol TrendingRepoTableViewCellViewModelType {
    func fetchData()
    var postDataClosure: ((String?, String?, String?, String?)->Void )? { get set }
}

class TrendingRepoTableViewCellViewModel: TrendingRepoTableViewCellViewModelType, ReusableTableViewCellViewModelType {
    
    
    //MARK: outputs
    var postDataClosure: ((String?, String?, String?, String?)->Void )?
    
    var reusableIdentifier: String { TrendingRepoTableViewCell.reuseIdentifier }
    private let item: Items
    init(item: Items) {
        self.item = item
    }
}

extension TrendingRepoTableViewCellViewModel {
    
    func fetchData() {
        postDataClosure?(item.name,item.language, "\(String(describing: item.stargazers_count))", item.owner?.avatar_url)
    }
}
