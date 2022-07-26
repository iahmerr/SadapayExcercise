//
//  TrendingRepoModuleBuilder.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation
import UIKit

protocol TrendingRepoModuleBuilding {
    func createModule()->UIViewController
}

final class TrendingRepoModuleBuilder: TrendingRepoModuleBuilding{
    func createModule() -> UIViewController {
        let viewController: UIViewController = TrendingRepoListViewController(viewModel: TrendingRepoListViewModel(apiService: ApiService()))
        let navigationController = UINavigationControllerFactory.createTransparentNavigationController(rootViewController: viewController)
        return navigationController
    }
}
