//
//  Application.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import Swinject

final class Application {
    static let shared = Application()
    
    private init() {
    }
    
    func configureMainInterface(in window: UIWindow) {
        let navigationController = UINavigationController()
        let controller: RepositoryViewController = DefaultAssembler.shared.resolveController(navigation: navigationController)
        navigationController.viewControllers = [controller]
        window.rootViewController = navigationController
    }
}
