//
//  ResultsViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/31/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    static var isMovie: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ResultsViewController.isMovie == true {
            return MovieController.movies.count
        } else if ResultsViewController.isMovie == false {
            return TVShowController.tvShows.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        
        if ResultsViewController.isMovie == true {
            let movie = MovieController.movies[indexPath.row]
            cell.textLabel?.text = movie.originalTitle
            
        } else if ResultsViewController.isMovie == false {
            let tvShow = TVShowController.tvShows[indexPath.row]
            cell.textLabel?.text = tvShow.originalTitle
        }
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ResultsViewController.isMovie == true {
            performSegue(withIdentifier: "toMovieDetail", sender: self)
        } else if ResultsViewController.isMovie == false {
            performSegue(withIdentifier: "toTvShowDetail", sender: self)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetail" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            let movie = MovieController.movies[index.row]
            let movieVC = segue.destination as? MovieDetailViewController
            movieVC?.movie = movie
        }
        
        if segue.identifier == "toTvShowDetail" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            let tvShow = TVShowController.tvShows[index.row]
            let tvShowVC = segue.destination as? TVShowDetailViewController
            tvShowVC?.tvShow = tvShow
        }
    }
 

}
