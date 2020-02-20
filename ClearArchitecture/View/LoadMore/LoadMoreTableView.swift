//
//  LoadMoreTableView.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/20.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MJRefresh

class LoadMoreTableView: UITableView {
    
    /**
     * Refresh and trigger event
    **/
    var refreshHeader: MJRefreshHeader? {
        didSet {
            mj_header = refreshHeader
            mj_header?.refreshingBlock = { [weak self] in
                self?._refreshTrigger.onNext(())
            }
        }
    }
    
    private var _refreshTrigger = PublishSubject<Void>()
    lazy var refreshTrigger: Driver<Void> = {
        return _refreshTrigger.asDriverOnErrorJustComplete()
    }()
    
    var refreshing: Binder<Bool> {
        return Binder(self) { (tableView, loading) in
            let header = tableView.mj_header
            loading ? header?.beginRefreshing() : header?.endRefreshing()
        }
    }
    
    /**
    * Footer View and trigger event
    **/
    var refreshFooter: MJRefreshFooter? {
        didSet {
            mj_footer = refreshFooter
            mj_footer?.refreshingBlock = { [weak self] in
                self?._loadMoreTrigger.onNext(())
            }
        }
    }
    
    private var _loadMoreTrigger = PublishSubject<Void>()
    lazy var loadMoreTrigger: Driver<Void> = {
        return _loadMoreTrigger.asDriverOnErrorJustComplete()
    }()
    
    var loadingMore: Binder<Bool> {
        return Binder(self) { (tableView, loading) in
            let footer = tableView.mj_footer
            loading ? footer?.beginRefreshing() : footer?.endRefreshing()
        }
    }
    
    /**
     * Hidden loadmore
     */
    
    var isHiddenLoadMore: Binder<Bool> {
        return Binder(self) { (tableView, isHidden) in
            tableView.refreshFooter?.isHidden = isHidden
            tableView.refreshFooter?.alpha = isHidden ? 0 : 1
        }
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
