//
//  Endpoint.swift
//  RydeEssays
//
//  Created by Morris Murega on 5/23/21.
//

import Foundation

enum Endpoint {
    case all
    case auth
}

extension Endpoint: API {
    var endpoint: String {
        switch self {
        case .all: return RequestPaths(config: AppDelegate.AppConfig!).BASE_PATH
        case .auth: return RequestPaths(config: AppDelegate.AppConfig!).BASE_PATH
        }
    }
    
    var host : String{
        return RequestPaths(config: AppDelegate.AppConfig!).HOST
    }
    
    var scheme : String{
        return RequestPaths(config: AppDelegate.AppConfig!).SCHEME
    }
}
