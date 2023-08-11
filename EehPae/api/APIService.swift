//
//  APIService.swift
//  RydeEssays
//
//  Created by Morris Murega on 5/22/21.
//

import Foundation
class APIService{
    
    public func sendPostRequest<T:Decodable>(with method : String, requestObject:T.Type, completion : @escaping(Result<T>) -> Void){
        
        let session = URLSession.shared
        let url = URL(string: "http://127.0.0.1/rydeessays/\(method)")!
        
        var request = URLRequest(url: url,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = UserDefaults.standard.string(forKey: "token"){
            request.setValue("Authorization", forHTTPHeaderField: token)
        }
        
        let jsonData = try! JSONEncoder().encode(requestObject)
        
        let requestData = try! JSONSerialization.data(withJSONObject: request, options: [])
        request.httpBody = requestData
        
        let task =  session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else{
                completion(Result.failure(APPError.networkError(error!)))
                return
            }
            
            guard let data = data else{
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            
            do {
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode(requestObject.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
            
        })
        
        task.resume()
        
        
    }
}
