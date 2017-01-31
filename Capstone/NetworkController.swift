//
//  NetworkController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/19/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class NetworkController {
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Path = "PATCH"
        case Delete = "DELETE"
    }
    
    //perform the request
    static func performRequest(for url: URL, httpMethod: HTTPMethod, urlParameters: [String : String]? = nil, body: Data? = nil, completion: ((Data?,Error?) -> Void)? = nil) {
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            completion?(data, error)
        }
        
        dataTask.resume()
    }
    
    //This adds parametes to the base url
    static func url(byAdding parameters: [String : String]?, to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.flatMap({URLQueryItem(name: $0.0, value: $0.1)})
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
}

