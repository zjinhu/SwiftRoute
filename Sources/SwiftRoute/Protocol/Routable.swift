//
//  Routable.swift
//  SwiftMediator
//
//  Created by iOS on 2023/5/26.
//

import Foundation
import SafariServices
public protocol Routable{
    
    /// Initialize the current class
    /// - Parameter params: Parameters required to create UIViewController
    /// - Returns: protocol type
    static func initVC(params: [String: Any]) -> Routable

    /// Custom route handling
    /// - Parameter path: registered path
    func openRouter(path: String)
    
    /// Call the static function method
    /// - Parameters:
    /// - params: the parameters that need to be passed
    /// - callback: closure callback
    static func callStaticFunc(params: [String : Any], callback: (Any?) -> Void)
    
    /// Call the instance function method
    /// - Parameters:
    /// - params: the parameters that need to be passed
    ///   - callback: closure callback
    func callInstanceFunc(params: [String : Any], callback: (Any?) -> Void)

}
 
public extension Routable {
    ///This function can be implemented on its own
    func openRouter(path: String) {
 
        guard let url = URL(string: path) else { return }
 
        switch url.scheme {
        case "push":
            Router.shared.push(path, params: url.urlParameters)
        case "present":
            if #available(iOS 13.0, *) {
                Router.shared.present(path, params: url.urlParameters, modelStyle: .automatic)
            } else {
                Router.shared.present(path, params: url.urlParameters, modelStyle: .fullScreen)
            }
        case "fullScreen":
            Router.shared.present(path, params: url.urlParameters, modelStyle: .fullScreen)
        default:
            let safariController = SFSafariViewController(url: URL(string: path)!)
            UIViewController.currentViewController()?.present(safariController, animated: true, completion: nil)
        }
    }
    
    ///This function can be implemented on its own
    static func callStaticFunc(params: [String : Any], callback: (Any?) -> Void) {
        
    }
    
    ///This function can be implemented on its own
    func callInstanceFunc(params: [String : Any], callback: (Any?) -> Void) {
        
    }

}
