//
//  RepositoryPage.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/13.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Domain

struct RepositoryPage : Codable {
    let total_count : Int?
    let incomplete_results : Bool?
    let items : [Repository]?

    enum CodingKeys: String, CodingKey {

        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_count = try values.decodeIfPresent(Int.self, forKey: .total_count)
        incomplete_results = try values.decodeIfPresent(Bool.self, forKey: .incomplete_results)
        items = try values.decodeIfPresent([Repository].self, forKey: .items)
    }

}
