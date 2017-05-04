//
//  ResultsViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/31/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var isMovie: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().tintColor = UIColor(red: 202.0/255.0, green: 78.0/255.0, blue: 80.0/255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self 
    }
    
    // MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ResultsViewController.isMovie == true {
            return MovieController.movies.count
        } else if ResultsViewController.isMovie == false {
            return TVShowController.tvShows.count
        }
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultsCell", for: indexPath) as? ResultsCollectionViewCell else { return UICollectionViewCell() }
        
        if ResultsViewController.isMovie == true {
            let movie = MovieController.movies[indexPath.item]
            cell.updateWith(movie: movie)
            
        } else if ResultsViewController.isMovie == false {
            let tvShow = TVShowController.tvShows[indexPath.item]
            cell.updateWith(tvShow: tvShow)
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if ResultsViewController.isMovie == true {
           // performSegue(withIdentifier: "toMovieDetail", sender: self)
        } else if ResultsViewController.isMovie == false {
          //  performSegue(withIdentifier: "toTvShowDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetail" {
            if let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell) {
                let movie = MovieController.movies[indexPath.item]
                let movieVC = segue.destination as? MovieDetailViewController
                movieVC?.movie = movie
            }
        }
        
        if segue.identifier == "toTvShowDetail" {
            if let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell) {            let tvShow = TVShowController.tvShows[indexPath.item]
                let tvShowVC = segue.destination as? TVShowDetailViewController
                tvShowVC?.tvShow = tvShow
            }
        }
    }
    
    //  MARK: - Actions 
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}
