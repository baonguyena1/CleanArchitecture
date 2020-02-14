//
//  PostUseCase.swift
//  Domain
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import RxSwift
import OrderedSet

public protocol RepositoryUseCaseProtocol {
    func getRepositories(page: Int, size: Int) -> Observable<PagingInfo<Repository>>
}

final class RepositoryUseCase: RepositoryUseCaseProtocol {
    
    private let network: RepositoryNetwork
    
    init(network: RepositoryNetwork) {
        self.network = network
    }
    
    func getRepositories(page: Int, size: Int) -> Observable<PagingInfo<Repository>> {
        return network.getRepositories(page: page, size: size)
            .map { (response) in
                guard let repositories = response.items, let totalPage = response.total_count else {
                    throw APIError.invalidResponseData
                }
                return PagingInfo<Repository>(page: page,
                                              items: OrderedSet(sequence: repositories),
                                              totalPage: totalPage)
        }
    }
}
