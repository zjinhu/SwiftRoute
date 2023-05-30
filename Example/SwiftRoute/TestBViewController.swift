//
//  TestBViewController.swift
//  Example
//
//  Created by iOS on 2023/5/30.
//

import UIKit
import SwiftRoute
import SwiftBrick
import SnapKit
import SwiftShow
class TestBViewController: ViewController {

    var titleName : String?
    var str : String?
    var num : Int = 0
    var dic : [String : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = titleName
        self.view.backgroundColor = .random
        
        let label = UILabel().then { lab in
            lab.backgroundColor = .orange
            lab.numberOfLines = 0
            lab.text = "Received String:\(str ?? "")--Received Int:\(num)"
            lab.textColor = .random
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalToSuperview().offset(200)
        }
        
        let label2 = UILabel().then { lab in
            lab.backgroundColor = .orange
            lab.numberOfLines = 0
            lab.text = "Dictionary received:\(String(describing: dic))--Int received:\(num)"
            lab.textColor = .random
        }
        view.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalToSuperview().offset(300)
        }
        
        let button = UIButton().then { btn in
            btn.backgroundColor = .random
            btn.setTitle("Close page", for: .normal)
            btn.addTouchUpInSideBtnAction { _ in
                
                Router.shared.dismissVC()
            }
        }
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.height.equalTo(100)
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(60)
        }
    }
}

extension TestBViewController: Routable {
    static func callStaticFunc(params: [String : Any], callback: (Any?) -> Void) {
        debugPrint("1212")
        callback("111")
        Show.toast("接收到参数\(params)")
    }
    
    func callInstanceFunc(params: [String : Any], callback: (Any?) -> Void) {
        debugPrint("2323")
        callback("222")
        Show.toast("接收到参数\(params)")
    }
    

    // 返回一个路由协议的实例
    static func initVC(params: [String : Any]) -> Routable {
        let vc = TestBViewController()
        vc.dic = params
        return vc
    }
 
//    func openRouter(path: String) {
//        debugPrint("\(path)")
//    }
}

public extension Router {
    @objc
    func registerBController() -> RoutePath {
        return RoutePath(path: "app://xxx",
                          routerClass: TestBViewController.self)
    }
}

