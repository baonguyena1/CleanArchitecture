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

final class AllPostUseCase: Domain.AllPostUseCase {
    private let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func getPosts() -> Observable<[Post]> {
        let stored = repository.fetchPosts()
        return stored
    }
    
}
