//
//  TrendingRepoListViewController.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import UIKit

class TrendingRepoListViewController: UIViewController {

    private let viewModel: TrendingRepoListViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = viewModel.outputs.getTitle()
    }
    
    init(viewModel: TrendingRepoListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


