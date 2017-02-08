//
//  HomeScreenViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/24/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
            UINavigationBar.appearance().tintColor = UIColor(red: 202.0/255.0, green: 78.0/255.0, blue: 80.0/255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func movieButtonTapped(_ sender: Any) {
        GenreController.genreRowIDs.removeAll()
        GenreViewController.isMovie = true
        ResultsViewController.isMovie = true 
        
        LoadingOverlay.shared.showOverlay(view: view)
        
        GenreController.grabMovieGenreList { (genre) in
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toGenreScreen", sender: self)
            }
        }
    }
    
    @IBAction func tvShowButtonTapped(_ sender: Any) {
        GenreController.genreRowIDs.removeAll()
        GenreViewController.isMovie = false
        ResultsViewController.isMovie = false
        
        LoadingOverlay.shared.showOverlay(view: view)
        
        GenreController.grabTVShowGenreList { (genre) in
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toGenreScreen", sender: self)
            }
        }
    }
}
