//
//  PostUseCase.swift
//  Domain
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import RxSwift

public protocol AllPostUseCase {
    func getPosts() -> Observable<[Post]>
}
