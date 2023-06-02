//
//  Router+target.swift
//  SwiftRoute
//
//  Created by iOS on 2023/6/2.
//

import Foundation
///非注册直接使用方式
extension Router {
    
    public static func initVC(_ vcName: String,
                              moduleName: String? = nil,
                              params: [String: Any]? = nil) -> UIViewController? {
        
        guard let controller = Router.initObjc(vcName,
                                               moduleName: moduleName,
                                               params: params) as? UIViewController else { return nil }
        return controller
    }
    
    public static func initObjc(_ objcName: String,
                                moduleName: String? = nil,
                                params: [String: Any]? = nil) -> Routable? {
        
        var namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        if let name = moduleName {
            namespace = name
        }
        
        let className = "\(namespace).\(objcName)"
        let cls: AnyClass? = NSClassFromString(className)
        guard let ob = cls as? Routable.Type else {
            return nil
        }
        let par = params ?? [:]
        let objc = ob.inits(params: par)
        return objc
    }
}
