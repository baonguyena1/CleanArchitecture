//
//  PostUseCase.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import OrderedSet

final class RepositoryUseCase: Domain.RepositoryUseCase {
    
    private let repository: RepositoryNetwork
    
    init(repository: RepositoryNetwork) {
        self.repository = repository
    }
    
    func getRepositories(page: Int, size: Int) -> Observable<PagingInfo<Repository>> {
        return repository.getRepositories(page: page, size: size)
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
