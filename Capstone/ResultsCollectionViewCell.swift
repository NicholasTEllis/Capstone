//
//  ResultsCollectionViewCell.swift
//  Flix Finder
//
//  Created by Nicholas Ellis on 2/8/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class ResultsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var resultsImageView: UIImageView!
    
    func updateWith(movie: Movie) {
        guard let poster = movie.posterPath else { return }
        let baseURL = URL(string: "http://image.tmdb.org/t/p/w500/")
        if let imageURL = baseURL?.appendingPathComponent(poster) {
            
            ImageController.image(forURL: imageURL) { (image) in
                self.resultsImageView.image = image
            }
        }
    }
    
    func updateWith(tvShow: TVShow) {
        guard let poster = tvShow.posterPath else { return }
        let baseURL = URL(string: "http://image.tmdb.org/t/p/w500/")
        if let imageURL = baseURL?.appendingPathComponent(poster) {
            
            ImageController.image(forURL: imageURL) { (image) in
                self.resultsImageView.image = image
            }
        }
    }
}
