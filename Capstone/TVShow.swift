//
//  TVShow.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/24/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class TVShow {
    
    fileprivate let kBackDropPath = "backdrop_path"
    fileprivate let kFirstAirDate = "first_air_date"
    fileprivate let kID = "id"
    fileprivate let kOriginalTitle = "original_name"
    fileprivate let kOverview = "overview"
    fileprivate let kPostPath = "poster_path"
    fileprivate let kVoteAverage = "vote_average"
    fileprivate let kGenres = "genre_ids"
    
    var backDropPath: String?
    var firstAirDate: String?
    var id: Int?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var voteAverage: Int?
    var genres: [Int]?
    
    
    init(backDropPath: String, firstAirDate: String, id: Int, originalTitle: String, overview: String, posterPath: String, voteAverage: Int, genres: [Int]) {
        self.backDropPath = backDropPath
        self.firstAirDate = firstAirDate
        self.id = id
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.genres = genres
    }
    
    init?(json: [String : Any]) {
        guard let backDropPath = json[kBackDropPath] as? String,
            let firstAirDate = json[kFirstAirDate] as? String,
            let id = json[kID] as? Int,
            let overview = json[kOverview] as? String,
            let originalTitle = json[kOriginalTitle] as? String,
            let posterPath = json[kPostPath] as? String,
            let voteAverage = json[kVoteAverage] as? Int,
            let genres = json[kGenres] as? [Int] else {
                return nil }
        self.backDropPath = backDropPath
        self.firstAirDate = firstAirDate
        self.id = id
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.genres = genres
    }
}
