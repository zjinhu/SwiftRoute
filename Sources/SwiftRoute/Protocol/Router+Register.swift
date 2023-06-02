//
//  Router.swift
//  SwiftMediator
//
//  Created by iOS on 2023/5/26.
//

import Foundation
import UIKit

/// 扩展路由类,添加一个以register开头的注册函数,返回一个RoutePath对象
/// Extend the routing class, add a registration function starting with register, and return a RoutePath object
public class Router: NSObject{
    static let shared = Router()
    private override init(){
        super.init()
        registerMethods()
    }
    
    var routers: [String: AnyClass] = [:]
    
    private func registerMethods(){
        var methodCount: UInt32 = 0
        if let methodList = class_copyMethodList(Router.self, &methodCount) {
            for i in 0..<Int(methodCount) {
                let method = methodList[i]
                let methodName = sel_getName(method_getName(method))
                let name = String(cString: methodName)
                if name.hasPrefix("register"){
                    let sel: Selector = NSSelectorFromString(name)
                    if responds(to: sel),
                       let result = perform(sel).takeUnretainedValue() as? RoutePath {
                        routers[result.path] = result.routerClass
                    }
                }
            }
            free(methodList)
        } else {
            print("No methods found for class \(Router.self).")
        }
    }
    
    func getRoutable(_ urlString: String, params: [String: Any]?) -> Routable? {
        guard let url = URL(string: urlString), let urlScheme = url.scheme else { return nil }
        
        var routerModel: AnyClass? = routers[urlScheme]
        
        if let _ = routerModel {
            
        }else{
            let path = urlString.components(separatedBy: "?").first ?? ""
            routerModel = routers[path]
        }
        
        let par = params ?? [:]
        
        if let cls = routerModel, let routable = (cls as? Routable.Type)?.inits(params: par) {
            return routable
        }
        return nil
    }
    
}




