//
//  APIInput.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Alamofire

final public class APIInput {
    var urlString: String
    var method: HTTPMethod
    var parameters: Parameters?
    var queries: [URLQueryItem]
    var encoding: ParameterEncoding
    var headers: HTTPHeaders?
    
    init(urlString: String, method: HTTPMethod, queries: [URLQueryItem] = [], parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil) {
        self.urlString = urlString
        self.method = method
        self.queries = queries
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }

}

extension APIInput {
    var urlEncoding: String {
        guard let url = URL(string: urlString),
            var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return urlString
        }
        urlComponent.queryItems = queries
        return urlComponent.url?.absoluteString.urlEscaped ?? urlString
    }
}
