//
//  SearchResultsTableViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/25/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarTextField: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    static var isMovie: Bool = false
    
    var sourceTableViewController: UIViewController?
    
    var movieResults: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var tvShowResults: [TVShow] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarTextField.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return movieResults.count
        } else {
            return tvShowResults.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsCell", for: indexPath) as? SearchResultsTableViewCell else { return UITableViewCell() }
        if segmentedControl.selectedSegmentIndex == 0 {
            let result = movieResults[indexPath.row]
            cell.updateWith(movie: result)
            SearchResultsTableViewController.isMovie = true
        } else {
            let tvResult = tvShowResults[indexPath.row]
            cell.updateWith(tvShow: tvResult)
        }
        
        return cell
    }
    
    func makeNetworkCallBasedOnSelection() {
        guard let query = searchBarTextField.text else { return }
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            MovieController.searchMovies(query: query, completion: { (movie) in
                self.movieResults = movie
            })
           // SearchResultsTableViewController.isMovie = true
        case 1:
            TVShowController.searchTVShow(query: query, completion: { (tvShow) in
                self.tvShowResults = tvShow
            })
            
        default:
            break
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        makeNetworkCallBasedOnSelection()
        searchBarTextField.resignFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if SearchResultsTableViewController.isMovie == true {
            performSegue(withIdentifier: "searchToMovieDetail", sender: self)
        } else if SearchResultsTableViewController.isMovie == false {
            performSegue(withIdentifier: "searchToTvShowDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchToMovieDetail" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            let movie = MovieController.movies[index.row]
            let movieVC = segue.destination as? MovieDetailViewController
            movieVC?.movie = movie
        }
        
        if segue.identifier == "searchToTvShowDetail" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            let tvShow = TVShowController.tvShows[index.row]
            let tvShowVC = segue.destination as? TVShowDetailViewController
            tvShowVC?.tvShow = tvShow
        }

    }
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        makeNetworkCallBasedOnSelection()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
