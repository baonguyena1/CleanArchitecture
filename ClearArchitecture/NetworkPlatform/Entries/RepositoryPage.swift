//
//  RepositoryPage.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

struct RepositoryPage: Codable {
    let total_count: Int?
    let incomplete_results: Bool?
    let items: [Repository]?
}
