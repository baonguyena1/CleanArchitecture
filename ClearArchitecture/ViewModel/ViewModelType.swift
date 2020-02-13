//
//  ViewModelType.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
