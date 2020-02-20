//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

class UseCaseProvider {
    static let shared = UseCaseProvider()
    
    private var networkProvider: NetworkProvider!
    
    private init() {
        self.networkProvider = NetworkProvider()
    }
    
    func makeRepositoryUseCase() -> RepositoryUseCase {
        return RepositoryUseCase(network: networkProvider.makeRepositoryNetwork())
    }
}
