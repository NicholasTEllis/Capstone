//
//  GenreController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 2/1/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class GenreController {
    static let movieBaseURL = URL(string: "https://api.themoviedb.org/3/genre/movie/list")
    static let tvShowBaseURL = URL(string: "https://api.themoviedb.org/3/genre/tv/list")
    
    static func grabMovieGenreList(completion: @escaping ([Genre]) -> Void) {
        guard let url = movieBaseURL else {
            completion([])
            return
        }
        
        let urlParameters = ["api_key" : "22c83f675542ad3f964cdc8a67271920"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("Could not recieve data")
                completion([])
                return
            }
            
            guard let returnedDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any],
                let genreDictionary = returnedDictionary["genres"] as? [[String : Any]] else {
                    NSLog("Could not parse json")
                    completion([])
                    return
            }
            
            let movieGenres = genreDictionary.flatMap { Genre(jsonDictionary: $0) }
            print(response)
            completion(movieGenres)
        }
    }
    
    
    static func grabTVShowGenreList(completion: @escaping ([(Genre)]) -> Void) {
        guard let url = tvShowBaseURL else {
            completion([])
            return
        }
        
        let urlParameters = ["api_key" : "22c83f675542ad3f964cdc8a67271920"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("Could not get the data back")
                completion([])
                return
            }
            
            guard let returnedDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any],
                let genreDictionary = returnedDictionary["genres"] as? [[String : Any]] else {
                    NSLog("Could not parse the data")
                    completion([])
                    return
            }
            
            let tvShowGenres = genreDictionary.flatMap { Genre(jsonDictionary: $0) }
            print(response)
            completion(tvShowGenres)
        }
    }
}