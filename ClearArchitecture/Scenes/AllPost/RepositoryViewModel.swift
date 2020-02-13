//
//  RepositoryViewModel.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

struct RepositoryViewModel: ViewModelType {
    
    var useCase: RepositoryUseCase!
    var navigator: RepositoryNavigator!
    
    struct Input {
        let fetchingTrigger: Driver<Void>
        let refreshTrigger: Driver<Void>
        let loadMoreTrigger: Driver<Void>
    }
    
    struct Output {
        let repositories: Driver<PagingInfo<Repository>>
        let loading: Driver<Bool>
        let error: Driver<Error>
    }
    
    func transform(_ input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let loadMoreOutput = self.setupLoadMorePaging(loadTrigger: input.fetchingTrigger,
                                                      getItems: { () -> Observable<PagingInfo<Repository>> in
            return self.useCase.getRepositories(page: PageSize.firstPage, size: PageSize.size)
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
        }, refreshTrigger: input.refreshTrigger, refreshItems: { () -> Observable<PagingInfo<Repository>> in
            return self.useCase.getRepositories(page: PageSize.firstPage, size: PageSize.size)
                .trackError(errorTracker)
        }, loadMoreTrigger: input.loadMoreTrigger) { (page) -> Observable<PagingInfo<Repository>> in
            return self.useCase.getRepositories(page: page, size: PageSize.size)
            .trackError(errorTracker)
        }
        
        let (page, fetchItems, error, loading, refreshing, loadingMore) = loadMoreOutput
        
        return Output(repositories: page.asDriver(),
                      loading: Driver.merge(activityIndicator.asDriver(), loading.asDriver()),
                      error: Driver.merge(errorTracker.asDriver(), error.asDriver()))
    }
    
}
