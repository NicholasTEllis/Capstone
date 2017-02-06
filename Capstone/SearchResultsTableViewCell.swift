//
//  SearchResultsTableViewCell.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/25/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var searchResultsImage: UIImageView!
    
    @IBOutlet weak var searchResultsTitleLabel: UILabel!
    
    @IBOutlet weak var searchResultsDescriptionLabel: UILabel!
    
    //// MARK: -Finish putting images in this lad
    
    func updateWith(tvShow: TVShow) {
       // searchResultsImage.image = tvShow.posterPath
        searchResultsTitleLabel.text = tvShow.originalTitle
        searchResultsDescriptionLabel.text = tvShow.overview
        
        guard let poster = tvShow.posterPath else {
            return
        }
        let baseURL = URL(string: "http://image.tmdb.org/t/p/w500/")
        if let imageURL = baseURL?.appendingPathComponent(poster) {
            
            ImageController.image(forURL: imageURL) { (image) in
                self.imageView?.image = image
            }
        }
    }
    
    func updateWith(movie: Movie) {
        searchResultsTitleLabel.text = movie.originalTitle
        searchResultsDescriptionLabel.text = movie.overview
        guard let poster = movie.posterPath else {
            return
        }
        let baseURL = URL(string: "http://image.tmdb.org/t/p/w500/")
        if let imageURL = baseURL?.appendingPathComponent(poster) {
            
            ImageController.image(forURL: imageURL) { (image) in
                self.imageView?.image = image
            }
        }
    }
    
}

