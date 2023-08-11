//
//  API.swift
//  RydeEssays
//
//  Created by Morris Murega on 5/23/21.
//

import Foundation

protocol API {
    var scheme: String { get }
    var host: String { get }
    var endpoint: String { get }
}

extension API {
    
    func generateRequest<T: Encodable>(parameters: T, method: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.endpoint
        
        var params =  try! DictionaryEncoder.encode(parameters)
        
        guard let appid = AppDelegate.AppConfig?.headers.app_id else {return nil}
        params[Constants.KEY_APPID] = appid
        components.setQueryItems(with: params)
        var request = URLRequest(url: components.url!)
        request.setValue(Constants.KEY_CONTENT_TYPE_LABEL, forHTTPHeaderField: Constants.KEY_CONTENT_TYPE_HEADER)
        if let token = AppDelegate.AppStore[Constants.KEY_TOKEN] as? String{
            request.setValue(Constants.KEY_AUTHORIZATION_LABEL, forHTTPHeaderField: token)
        }
        request.httpMethod = method
        return request
    }
}
