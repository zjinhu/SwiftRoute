//
//  Router+Method.swift
//  SwiftRoute
//
//  Created by iOS on 2023/6/2.
//

import Foundation

extension Router {

    public static func callRoutableFunc(_ routable: Routable,
                                        params: [String: Any] = [:],
                                        callback: ((Any?) -> Void)? = nil){
        let completion = callback ?? { _ in }
        routable.callInstanceFunc(params: params, callback: completion)
    }

    public static func callInstanceFunc(_ route: String,
                                        initParams: [String: Any] = [:],
                                        funcParams: [String: Any] = [:],
                                        callback: ((Any?) -> Void)? = nil){
        
        var routable: Routable?
        if let url = URL(string: route),
           let _ = url.scheme {
            routable = Router.shared.getRoutable(route, params: initParams)
        }else{
            routable = Router.initObjc(route, params: initParams)
        }

        let completion = callback ?? { _ in }
        routable?.callInstanceFunc(params: funcParams, callback: completion)
    }

    public static func callStaticFunc(_ route: String,
                               params: [String: Any] = [:],
                               callback: ((Any?) -> Void)? = nil){
        
        var cls: AnyClass?
        
        if let url = URL(string: route),
           let urlScheme = url.scheme {
            
            cls = Router.shared.routers[urlScheme]
            
            if let _ = cls {
                
            }else{
                let path = route.components(separatedBy: "?").first ?? ""
                cls = Router.shared.routers[path]
            }
        }else{
            cls = NSClassFromString(route)
        }

        let completion = callback ?? { _ in }
        
        if let cls = cls, let routable = cls as? Routable.Type {
            routable.callStaticFunc(params: params, callback: completion)
        }
    }
}
