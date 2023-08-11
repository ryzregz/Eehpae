//
//  RequestHeaders.swift
//  RydeEssays
//
//  Created by Morris Murega on 5/23/21.
//

import Foundation

enum RequestHeaders {
    case contentType(String)
    case authorization(String)
    var header: (field: String, value: String) {
        switch self {
        case .contentType(_): return (field: Constants.KEY_CONTENT_TYPE_LABEL, value: Constants.KEY_CONTENT_TYPE_HEADER)
        case.authorization(_): return (field : Constants.KEY_AUTHORIZATION_LABEL, value: AppDelegate.AppStore[Constants.KEY_TOKEN] != nil ?  AppDelegate.AppStore[Constants.KEY_TOKEN] as! String : "" )
        }
    }
}
