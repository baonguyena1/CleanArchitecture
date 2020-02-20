//
//  Storyboard.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/20.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case Main
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}
