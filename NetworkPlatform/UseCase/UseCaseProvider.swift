//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeRepositoryUseCase() -> Domain.RepositoryUseCase {
        return RepositoryUseCase(repository: networkProvider.makePostRepository())
    }
}
