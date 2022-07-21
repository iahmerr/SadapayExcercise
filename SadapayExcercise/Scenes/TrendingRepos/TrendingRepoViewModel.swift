//
//  TrendingRepoViewModel.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

protocol TrendingRepoListViewModelType {
    func fetchGitRepos()
    func getTitle() -> String
    func getNumberOfCells(for section: Int)-> Int
    func cellForRowData(at index: Int) -> ReusableTableViewCellViewModelType
    var reloadTableView: (()-> Void)? { get set }
}

final class TrendingRepoListViewModel: TrendingRepoListViewModelType {
     
    var reloadTableView: (()-> Void)?
    var dataSourceArray: [ReusableTableViewCellViewModelType] = []
    private let apiService: GitRepoService
    
    init(apiService: GitRepoService) {
        self.apiService = apiService
        createShimmerCells()
    }
    
}
//MARK: output functions
extension TrendingRepoListViewModel {
    
    func getTitle() -> String {
        return "Trending Repo"
    }
    
    func getNumberOfCells(for section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func cellForRowData(at index: Int) -> ReusableTableViewCellViewModelType {
        dataSourceArray[index]
    }
    
}

extension TrendingRepoListViewModel {
    func fetchGitRepos() {
        self.apiService.getGitTrendingRepo {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.createTableViewCells(response: response)
            case .failure(let fail):
                print(fail.error)
            }
        }
    }
}

extension TrendingRepoListViewModel {
    
    private func createShimmerCells() {
        dataSourceArray = []
        for _ in 0...10 {
            dataSourceArray.append(ShimmeringTableViewCellViewModel())
        }
        reloadTableView?()
    }
    
    private func createTableViewCells(response: GitReposResponse) {
        dataSourceArray = []
        let cellViewModels = response.items?.compactMap { TrendingRepoTableViewCellViewModel(item: $0) }
        self.dataSourceArray.append(contentsOf: cellViewModels!)
        reloadTableView?()
    }
}
