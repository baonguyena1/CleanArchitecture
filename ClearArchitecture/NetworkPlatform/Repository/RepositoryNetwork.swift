//
//  PostRepository.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import RxSwift

final class RepositoryNetwork {
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getRepositories(page: Int, size: Int) -> Observable<RepositoryPage> {
        let queries = [
            URLQueryItem(name: "q", value: "a"),
            URLQueryItem(name: "sort", value: "stars"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(size)")
        ]
        let apiInput = APIInput(urlString: "https://api.github.com/search/repositories", method: .get, queries: queries)
        return network.requestItem(apiInput).debug()
    }
}
