//
//  TrendingRepoListViewController.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import UIKit

class TrendingRepoListViewController: UIViewController {
    
    //MARK: UI Elements
    lazy var tableView: UITableView = UITableViewFactory.createUITableView(seperatorStyle: .none, showsVerticalScrollIndicator: false)

    private let viewModel: TrendingRepoListViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        self.title = viewModel.outputs.getTitle()
        setupViews()
        setupConstraints()
    }
    
    init(viewModel: TrendingRepoListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension TrendingRepoListViewController {
    
    func setupViews() {
        [tableView].forEach(view.addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//extension TrendingRepoListViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//}


