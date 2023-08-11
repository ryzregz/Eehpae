//
//  RequestPaths.swift
//  EehPae
//
//  Created by MacOS on 10/08/2023.
//

import Foundation
class RequestPaths{
    public var SCHEME = ""
    
    public var HOST = ""
    
    public var BASE_PATH = ""

    
    
    init(config:Config){
        guard let env = config.environments.first(where: { (en) -> Bool in
            return en.active
        }) else{
            Logger.Log(from:self as AnyObject,with:"Could not read config..")
            return
        }
        
        //
        HOST = env.rootURL
        BASE_PATH = env.rootURL
        
    }
}
