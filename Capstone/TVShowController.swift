
//
//  TVShowController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/24/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class TVShowController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/tv")
    static let tvShowDiscoveryURL = URL(string: "https://api.themoviedb.org/3/discover/tv")
    static var tvShows: [TVShow] = []
    
    static func searchTVShow(query: String, completion: @escaping ([TVShow]) -> Void) {
        tvShows.removeAll()
        guard let url = baseURL else { completion([]); return }
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: ["api_key" : "22c83f675542ad3f964cdc8a67271920", "query": query]) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("No data were received.")
                completion([])
                return
            }
            
            guard let returnedDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let tvShowDictionary = returnedDictionary["results"] as? [[String: Any]] else {
                    NSLog("Could not parse json. \n Response: \(response)")
                    completion([])
                    return
            }
            
            let tvShowsSearch = tvShowDictionary.flatMap { TVShow(json: $0) }
            print(response)
            for i in tvShowsSearch {
                tvShows.append(i)
            }
            completion(tvShows)
        }
    }
    
    static func discoverTVShows(completion: @escaping ([TVShow]) -> Void) {
        tvShows.removeAll()
        guard let url = tvShowDiscoveryURL else {
            completion([])
            return
        }
        
        let genreIDs = GenreController.genreRowIDs.map { String($0) }
        let stringGenres = genreIDs.joined(separator: ",")
        
        let urlParameters = ["api_key" : "22c83f675542ad3f964cdc8a67271920", "with_genres" : stringGenres]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("Could not get data back")
                completion([])
                return
            }
            
            print(response)
            
            guard let returnedDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any],
                let tvShowDiscoveryDictionary = returnedDictionary["results"] as? [[String :  Any]] else {
                    NSLog("Could not parse the data")
                    completion([])
                    return
            }
            
            let discoverTVShow = tvShowDiscoveryDictionary.flatMap { TVShow(json: $0) }
            for i in discoverTVShow {
                tvShows.append(i)
            }
            completion(discoverTVShow)
        }
    }

}
