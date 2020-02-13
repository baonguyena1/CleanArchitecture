//
//  AllPostViewModel.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

struct AllPostViewModel: ViewModelType {
    
    var useCase: AllPostUseCase!
    var navigator: AllPostNavigator!
    
    struct Input {
        let fetching: Driver<Void>
    }
    
    struct Output {
        let posts: Driver<[Post]>
    }
    
    func transform(_ input: Input) -> Output {
        let posts = input.fetching.flatMapLatest {
            return self.useCase.getPosts()
                .asDriver(onErrorJustReturn: [])
        }
        return Output(posts: posts)
    }
    
}
