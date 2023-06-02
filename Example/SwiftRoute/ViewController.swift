//
//  ViewController.swift
//  SwiftRoute
//
//  Created by iOS on 2023/5/11.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            ///SwiftUI示例
            let controller = UIHostingController(rootView:
                                                    SwiftUIView()
            )
            controller.view.frame = view.bounds
            addChild(controller)
            view.addSubview(controller.view)
            controller.didMove(toParent: self)
            
            debugPrint("\(ViewController.self)")
        }
    }


}

