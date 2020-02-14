//
//  APIResponseBase.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/11.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

class APIResponseBase: Codable {
    private(set) var code: Int!
    private(set) var message: String!
}
