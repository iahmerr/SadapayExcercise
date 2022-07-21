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

    private var viewModel: TrendingRepoListViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = viewModel.getTitle()
        setupViews()
        setupConstraints()
        bindViews()
    }
    
    init(viewModel: TrendingRepoListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchGitRepos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension TrendingRepoListViewController {
    
    func setupViews() {
        [tableView].forEach(view.addSubview)
        tableView.register(TrendingRepoTableViewCell.self, forCellReuseIdentifier: TrendingRepoTableViewCell.reuseIdentifier)
        tableView.register(ShimmeringTableViewCell.self, forCellReuseIdentifier: ShimmeringTableViewCell.reuseIdentifier)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func bindViews() {
        viewModel.reloadTableView = {[weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension TrendingRepoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfCells(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellForRowData(at: indexPath.row).reusableIdentifier, for: indexPath) as! ReusableTableViewCell
        cell.configure(with: viewModel.cellForRowData(at: indexPath.row))
        return cell
    }
}


