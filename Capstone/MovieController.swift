//
//  MovieController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/24/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    
    static func searchMovies(query: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = baseURL else { completion([]); return }
        let urlParameters = ["api_key" : "22c83f675542ad3f964cdc8a67271920", "query": query]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("No data were received.")
                completion([])
                return
            }
            
            print(data)
            
            guard let returnedDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let moviesDictionary = returnedDictionary["results"] as? [[String: Any]] else { NSLog("Could not parse json. \n Response: \(response)"); completion([])
                    return }
            
            let movies = moviesDictionary.flatMap { Movie(json: $0) }
            print(response)
            completion(movies)
        }
    }
}
