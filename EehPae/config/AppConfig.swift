//
//  AppConfig.swift
//  Finance Plan
//
//  Created by Morris Murega on 5/23/21.
//

import Foundation
struct Config: Decodable {
    var environments : [AppEnvironment]
    var resetDb:Bool
    var clientName: String
    var urls:ExternalLinks
    var headers : AppHeaders
    var messages:AppMessages
    var partnerIdentifier : String
    //
    enum CodingKeys : String, CodingKey {
        case environments
        case clientName = "client-name"

        case resetDb = "reset-db"
        //
        case urls = "urls"
        case headers
        //
        case messages
        
        case partnerIdentifier = "partner-identifier"
    }
}


struct AppMessages:Decodable{
    var serviceError:String
    var connectionError:String
    var reqSuccess:String
    var appUpdates:String
    
    enum CodingKeys:String,CodingKey{
        case serviceError = "service-error"
        case connectionError = "conn-error"
        case reqSuccess = "request-success"
        case appUpdates = "app-update"
    }
}

struct AppHeaders:Decodable{
    var app_id:String
    var version_name:String
    
    enum CodingKeys:String,CodingKey{
        case app_id = "app-id"
        case version_name = "version-name"
    }
}

struct ExternalLinks:Decodable{
    var appStoreLink:String
    
    enum CodingKeys:String,CodingKey{
        case appStoreLink = "app-store"
    }
}
struct AppEnvironment:Decodable {
    var name:String
    var active:Bool
    var appTimeout:Double
    var rootURL:String
    var endPoint:String
    var authLink:String
    var allLink:String
    var ordersLink:String
    var paymentLink:String
    var publicKey : String
    enum CodingKeys:String,CodingKey{
        case name
        case active
        case rootURL = "base-path"
        case appTimeout = "app-timeout"
        case endPoint = "end-point"
        case authLink = "auth-link"
        case allLink = "all-link"
        case ordersLink = "orders-link"
        case paymentLink = "payment-link"
        case publicKey = "public-key"
       
    }
}

