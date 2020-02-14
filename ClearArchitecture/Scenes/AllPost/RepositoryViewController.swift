//
//  AllPostViewController.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import NSObject_Rx

class RepositoryViewController: UIViewController, BindableType {
    
    var viewModel: RepositoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - BindableType
    func bindViewModel() {
        let input = RepositoryViewModel.Input(fetchingTrigger: rx.viewDidLoad.asDriver().mapToVoid())
        let output = viewModel.transform(input)

        output.repositories
            .drive(repositoryBinder)
            .disposed(by: rx.disposeBag)

        output.loading
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)

        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
    }
    
    private var repositoryBinder: Binder<PagingInfo<Repository>> {
        return Binder(self) { [weak self] (_, result) in
            print(result)
        }
    }

}

extension RepositoryViewController: StoryboardBased {
    static var sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
