//
//  TrendingRepoViewModel.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

protocol TrendingRepoListViewModelInput {
    
}

protocol TrendingRepoListViewModelOutput {
    func getTitle() -> String
}

protocol TrendingRepoListViewModelType {
    var inputs: TrendingRepoListViewModelInput { get }
    var outputs: TrendingRepoListViewModelOutput { get }
}

final class TrendingRepoListViewModel: TrendingRepoListViewModelInput, TrendingRepoListViewModelOutput, TrendingRepoListViewModelType {
    
    var inputs: TrendingRepoListViewModelInput { return self }
    var outputs: TrendingRepoListViewModelOutput { return self }
    
    init() {}
    
}
//MARK: output functions
extension TrendingRepoListViewModel {
    
    func getTitle() -> String {
        return "Trending Repo"
    }
}