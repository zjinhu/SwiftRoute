//
//  Router+Model.swift
//  SwiftRoute
//
//  Created by iOS on 2023/6/2.
//

import Foundation
extension Router {
    
    public static func present(_ route: String,
                               params: [String: Any]? = [:],
                               fromVC: UIViewController? = nil,
                               needNav: Bool = false,
                               modelStyle: UIModalPresentationStyle = .fullScreen,
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
        var container = routable
        
        if needNav {
            let nav = UINavigationController(rootViewController: container)
            container = nav
        }
        
        container.modalPresentationStyle = modelStyle
        
        guard let from = fromVC else {
            UIViewController.currentViewController()?.present(container, animated: animated, completion: nil)
            return
        }
        from.present(container, animated: animated, completion: nil)
    }
    
    /// Exit the current page
    public static func dismissVC(animated: Bool = true) {
        let current = UIViewController.currentViewController()
        if let viewControllers: [UIViewController] = current?.navigationController?.viewControllers {
            guard viewControllers.count <= 1 else {
                current?.navigationController?.popViewController(animated: animated)
                return
            }
        }
        
        if let _ = current?.presentingViewController {
            current?.dismiss(animated: animated, completion: nil)
        }
    }
    
}
