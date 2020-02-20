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
import MJRefresh

class RepositoryViewController: UIViewController, BindableType {
    
    @IBOutlet private weak var repositoryTableView: LoadMoreTableView!
    
    var viewModel: RepositoryViewModel!
    
    private var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        repositoryTableView.refreshHeader = MJRefreshHeader(refreshingBlock: {})
        repositoryTableView.refreshFooter = MJRefreshAutoFooter(refreshingBlock: {})
        repositoryTableView.register(cellType: RepositoryCell.self)
        
        repositoryTableView.estimatedRowHeight = 40
        repositoryTableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - BindableType
    func bindViewModel() {
        loadViewIfNeeded()
        let input = RepositoryViewModel.Input(fetchingTrigger: rx.viewDidLoad.asDriver().mapToVoid())
        let output = viewModel.transform(input)

        output.repositories
            .map { $0.items.map { $0 } }
            .drive(repositoryBinder)
            .disposed(by: rx.disposeBag)
        
        output.repositories
            .map { (result) -> Bool in
                return result.totalPage == result.page
            }
            .drive(repositoryTableView.isHiddenLoadMore)
            .disposed(by: rx.disposeBag)

        output.loading
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)

        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
    }
    
    private var repositoryBinder: Binder<[Repository]> {
        return Binder(self) { [weak self] (_, result) in
            self?.repositories = result
            DispatchQueue.main.async {
                self?.repositoryTableView.reloadData()
            }
        }
    }

}

extension RepositoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: RepositoryCell.self)
        cell.repository = repositories[indexPath.row]
        return cell
    }
}

extension RepositoryViewController: StoryboardBased {
    static var sceneStoryboard = Storyboard.Main.instance
}
