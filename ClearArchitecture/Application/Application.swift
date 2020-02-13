//
//  Application.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import Swinject
import NetworkPlatform

final class Application {
    static let shared = Application()
    
    private var dependencyAssembly: DependencyAssembly!
    
    private var container: Container {
        return dependencyAssembly.container
    }
    
    private init() {
        dependencyAssembly = DependencyAssembly()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let navigationController = UINavigationController()
        guard let controller = dependencyAssembly.container.resolve(RepositoryViewController.self, argument: navigationController) else {
            return
        }
        navigationController.viewControllers = [controller]
        window.rootViewController = navigationController
    }
}
