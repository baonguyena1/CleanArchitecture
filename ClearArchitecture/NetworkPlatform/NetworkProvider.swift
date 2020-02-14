//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

final class NetworkProvider {
    
    public func makeRepositoryNetwork() -> RepositoryNetwork {
        let network = Network()
        return RepositoryNetwork(network: network)
    }
}
