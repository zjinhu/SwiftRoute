//
//  ools.swift
//  SwiftMediator
//
//  Created by iOS on 2023/5/29.
//

import Foundation

//MARK:--URL get query dictionary
public extension URL {

    var urlParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
        let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }

}
