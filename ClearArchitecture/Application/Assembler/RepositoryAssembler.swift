//
//  RepositoryAssembler.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/20.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit

protocol RepositoryAssembler {
    func resolveController(navigation: UINavigationController) -> RepositoryViewController
}

extension RepositoryAssembler {
    func resolveController(navigation: UINavigationController) -> RepositoryViewController {
        let controller = RepositoryViewController.instantiate()
        let viewModel = resolveViewModel(navigation: navigation)
        controller.bindViewModel(to: viewModel)
        return controller
    }
    
    func resolveViewModel(navigation: UINavigationController) -> RepositoryViewModel {
        return RepositoryViewModel(useCase: UseCaseProvider.shared.makeRepositoryUseCase(),
                                   navigator: resolveNavigator(navigation: navigation))
    }
    
    func resolveNavigator(navigation: UINavigationController) -> RepositoryNavigator {
        return RepositoryNavigator(navigationController: navigation)
    }
}
