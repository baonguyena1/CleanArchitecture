//
//  AllPostViewController.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/12.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import NSObject_Rx

class AllPostViewController: UIViewController, BindableType {
    
    var viewModel: AllPostViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - BindableType
    func bindViewModel() {
        let input = AllPostViewModel.Input(fetching: self.rx.viewDidLoad.asDriver())
        let output = viewModel.transform(input)
        output.posts
            .drive(onNext: { (posts) in
                print(posts)
            })
            .disposed(by: rx.disposeBag)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllPostViewController: StoryboardBased {
    static var sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
