//
//  PagingInfo.swift
//  Domain
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import OrderedSet

public struct PagingInfo<T: Hashable> {
    public let page: Int
    public let items: OrderedSet<T>
    public var count: Int?
    public var totalPage: Int = 0
    
    public init(page: Int, items: OrderedSet<T>) {
        self.page = page
        self.items = items
        self.count = nil
    }
    
    public init(page: Int, items: OrderedSet<T>, totalPage: Int) {
        self.page = page
        self.items = items
        self.totalPage = totalPage
        self.count = nil
    }
    
    public init(page: Int, items: OrderedSet<T>, count: Int?) {
        self.page = page
        self.items = items
        self.count = count
    }
}
