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
        
        container.register(AllPostViewController.self) { (r, navigation: UINavigationController) in
            let controller = AllPostViewController.instantiate()
            controller.viewModel = r.resolve(AllPostViewModel.self, argument: navigation)
            return controller
        }
        .initCompleted { (r, c) in
            c.bindViewModel()
        }
        
        container.register(AllPostViewModel.self) { (r, navigation: UINavigationController) in
            var viewModel = AllPostViewModel()
            viewModel.useCase = r.resolve(AllPostUseCase.self)
            viewModel.navigator = r.resolve(AllPostNavigator.self, argument: navigation)
            return viewModel
        }
        
        container.register(AllPostNavigator.self) { (_, navigation: UINavigationController) -> AllPostNavigator in
            var navigator = AllPostNavigator()
            navigator.navigationController = navigation
            return navigator
        }
        
        container.register(AllPostUseCase.self) { r in
            let useCaseProvider = r.resolve(UseCaseProvider.self)
            assert(useCaseProvider != nil, "UseCaseProvider is nil")
            return useCaseProvider!.makeAllPostUseCase()
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
