//
//  Movie.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/24/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class Movie {
    
    fileprivate let kID = "id"
    fileprivate let kBackDropPath = "backdrop_path"
    fileprivate let kPosterPath = "poster_path"
    fileprivate let kOverview = "overview"
    fileprivate let kOriginalTitle = "original_title"
    fileprivate let kVoteAverage = "vote_average"
    fileprivate let kReleaseDate = "release_date"
    fileprivate let kGenres = "genre_ids"
    
    var id: Int?
    var backDropPath: String?
    var posterPath: String?
    var overview: String?
    var originalTitle: String?
    var voteAverage: Double?
    var releaseDate: String?
    var genres: [Int]?
    
    init(id: Int, backDrop: String, postPath: String, overview: String, originalTitle: String, voteAverage: Double, releaseDate: String, genres: [Int]) {
        self.id = id
        self.backDropPath = backDrop
        self.posterPath = postPath
        self.overview = overview
        self.originalTitle = originalTitle
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.genres = genres
    }
    
    init?(json: [String : Any]) {
        guard let id = json[kID] as? Int,
            let backDropPath = json[kBackDropPath] as? String,
            let posterPath = json[kPosterPath] as? String,
            let overview = json[kOverview] as? String,
            let originalTitle = json[kOriginalTitle] as? String,
            let voteAverage = json[kVoteAverage] as? Double,
            let releaseDate = json[kReleaseDate] as? String,
            let genres = json[kGenres] as? [Int] else {
                return nil }
        
        self.id = id
        self.backDropPath = backDropPath
        self.posterPath = posterPath
        self.overview = overview
        self.originalTitle = originalTitle
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.genres = genres
    }
    
}
