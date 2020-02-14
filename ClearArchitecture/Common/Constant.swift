//
//  Constant.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

struct APIHeader {
    static let contentType = "Content-Type"
    static let contentTypeValue = "application/json; charset=utf-8"
    
    static let accept = "Accept"
    static let acceptValue = "application/json"
}

struct PageSize {
    static let size = 10
    static let firstPage = 2
}

struct Constant {
    static let page = "page"
    static let perPage = "per_page"
}
