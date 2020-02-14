//
//  APIError.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/11.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case noStatusCode
    case invalidResponseData
    case unknown(statusCode: Int)
    case error(response: ResponseError)
    case invalidToken
    case expiredToken
    case customError(localizeDescription: String)
    
    var description: String {
        switch self {
        case let .unknown(code):
            return "api error unknow" + "\(code)"
        case .invalidResponseData:
            return "api error invalid response data"
        case let .error(response):
            return response.message ?? "api error unknow"
        case .invalidToken:
            return "invalid token"
        case let .customError(localizeDescription):
            return localizeDescription
        default:
            return String(describing: self)
        }
    }
    
    var code: Int {
        switch self {
        case let .error(response):
            return response.code ?? 0
        default:
            return 0
        }
    }
}
