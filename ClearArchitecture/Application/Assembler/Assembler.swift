//
//  Assembler.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/20.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

protocol Assembler: class, RepositoryAssembler {
    
}

class DefaultAssembler: Assembler {
    static let shared = DefaultAssembler()
}
