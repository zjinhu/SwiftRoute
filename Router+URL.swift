//
//  Router+URL.swift
//  SwiftRoute
//
//  Created by iOS on 2023/6/2.
//

import Foundation
extension Router {
 
    public static func open(_ route: String) {
        
        guard let url = URL(string: route) else { return }
        
        if let routable = Router.initObjc(route, params: url.urlParameters){
            routable.openRouter(path: route)
        }else if let routable = Router.shared.getRoutable(route, params: url.urlParameters){
            routable.openRouter(path: route)
        }else{
            debugPrint("unknown route")
        }

    }
}
