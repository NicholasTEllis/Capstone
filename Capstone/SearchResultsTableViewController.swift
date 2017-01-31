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
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        makeNetworkCallBasedOnSelection()
    }
}
