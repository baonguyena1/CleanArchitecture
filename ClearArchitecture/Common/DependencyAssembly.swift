//
//  DependencyAssembly.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import Swinject
import Domain
import NetworkPlatform

class DependencyAssembly {
    
    let container: Container = {
        let container = Container()
        
        container.register(RepositoryViewController.self) { (r, navigation: UINavigationController) in
            let controller = RepositoryViewController.instantiate()
            controller.viewModel = r.resolve(RepositoryViewModel.self, argument: navigation)
            return controller
        }
        .initCompleted { (_, c) in
            c.bindViewModel()
        }
        
        container.register(RepositoryViewModel.self) { (r, navigation: UINavigationController) in
            var viewModel = RepositoryViewModel()
            viewModel.useCase = r.resolve(RepositoryUseCase.self)
            viewModel.navigator = r.resolve(RepositoryNavigator.self, argument: navigation)
            return viewModel
        }
        
        container.register(RepositoryNavigator.self) { (_, navigation: UINavigationController) -> RepositoryNavigator in
            var navigator = RepositoryNavigator()
            navigator.navigationController = navigation
            return navigator
        }
        
        container.register(RepositoryUseCase.self) { r in
            let useCaseProvider = r.resolve(UseCaseProvider.self)
            assert(useCaseProvider != nil, "UseCaseProvider is nil")
            return useCaseProvider!.makeRepositoryUseCase()
        }
        
        container.register(UseCaseProvider.self) { _ in
            return NetworkPlatform.UseCaseProvider()
        }
        .inObjectScope(.container)
        return container
    }()
    
    private class func registerStoryboard() {
    }
    
    private class func registerViewModel() {
    }
    
    private class func registerService() {
    }
}
