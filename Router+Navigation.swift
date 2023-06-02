//
//  Router+Navigation.swift
//  SwiftRoute
//
//  Created by iOS on 2023/6/2.
//

import Foundation
extension Router {
    
    public static func push(_ route: String,
                            params: [String: Any]? = [:],
                            fromVC: UIViewController? = nil,
                            animated: Bool = true) {
        
        var routable: Routable?
        if let url = URL(string: route),
           let _ = url.scheme {
            routable = Router.shared.getRoutable(route, params: params)
        }else{
            routable = Router.initObjc(route, params: params)
        }
        
        guard let routable = routable as? UIViewController else {
            return
        }
        
        routable.hidesBottomBarWhenPushed = true
        guard let from = fromVC else {
            UIViewController.currentNavigationController()?.pushViewController(routable, animated: animated)
            return
        }
        from.navigationController?.pushViewController(routable, animated: animated)
    }
    
    /// The current UINavigationController pop to the previous page
    /// - Parameter animated: animated
    public static func pop(animated: Bool = true){
        guard let nav = UIViewController.currentNavigationController() else { return }
        nav.popViewController(animated: animated)
    }
    
    /// The current UINavigationController pop to the Root page
    /// - Parameter animated: animated
    public static func popToRoot(animated: Bool = true){
        guard let nav = UIViewController.currentNavigationController() else { return }
        nav.popToRootViewController(animated: animated)
    }
    
}
