//
//  Network.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/11.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

final class Network<T: Codable> {
    private var manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpAdditionalHeaders = [
            APIHeader.contentType: APIHeader.contentTypeValue,
            APIHeader.accept: APIHeader.acceptValue
        ]
        let manager = Alamofire.SessionManager(configuration: configuration, serverTrustPolicyManager: nil)
        return manager
    }()
    
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
    
    func getItem(_ input: APIInput) -> Observable<T> {
        return Observable.create { [weak self] (observable) -> Disposable in
            
            guard let `self` = self else {
                return Disposables.create()
            }
            let request = self.manager.request(input.urlEncoding, method: input.method, parameters: input.parameters, encoding: input.encoding, headers: input.headers)
                .responseData(queue: DispatchQueue.global(qos: .utility)) { (response) in
                    
                    switch response.result {
                    case .success(let data):
                        do {
                            let result = try self.decoder.decode(T.self, from: data)
                            observable.onNext(result)
                        } catch {
                            observable.onError(error)
                        }
                    case .failure(let error):
                        observable.onError(error)
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getItems(_ input: APIInput) -> Observable<[T]> {
        return Observable.create { [weak self] (observable) -> Disposable in
            
            guard let `self` = self else {
                return Disposables.create()
            }
            let request = self.manager.request(input.urlEncoding, method: input.method, parameters: input.parameters, encoding: input.encoding, headers: input.headers)
                .responseData(queue: DispatchQueue.global(qos: .utility)) { (response) in
                    
                    switch response.result {
                    case .success(let data):
                        do {
                            let result = try self.decoder.decode([T].self, from: data)
                            observable.onNext(result)
                        } catch {
                            observable.onError(error)
                        }
                    case .failure(let error):
                        observable.onError(error)
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
