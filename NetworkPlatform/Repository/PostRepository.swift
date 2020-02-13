//
//  PostRepository.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Domain
import RxSwift

public final class PostRepository {
    private let network: Network<Post>
    
    init(network: Network<Post>) {
        self.network = network
    }
    
    public func fetchPosts() -> Observable<[Post]> {
        let apiInput = APIInput(urlString: "https://jsonplaceholder.typicode.com/posts", method: .get)
        return network.getItems(apiInput)
    }
}
