//
//  HomeScreenViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/24/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var genres: [Genre] = []
    var isSuccess: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isSuccess == true {
            if segue.identifier == "movieButtonClickedSegue" {
                let vc = segue.destination as? GenreViewController
                vc?.genres = genres
            }
            
            if segue.identifier == "tvShowButtonClickedSegue" {
                let vc = segue.destination as? GenreViewController
                vc?.genres = genres
            }
        }
    }
    
    @IBAction func movieButtonTapped(_ sender: Any) {
        GenreController.grabMovieGenreList { (genre) in
            self.genres = genre
            self.isSuccess = true
        }
    }
    
    @IBAction func tvShowButtonTapped(_ sender: Any) {
        GenreController.grabTVShowGenreList { (genre) in
            self.genres = genre
        }
    }
    
    // Activity View
    private func showActivityIndicator() -> UIView {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(effectView)
        NSLayoutConstraint.activate([
            effectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            effectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            effectView.topAnchor.constraint(equalTo: view.topAnchor),
            effectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        effectView.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        spinner.startAnimating()
        return effectView
        
    }
    
}
