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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showActivityIndicator() -> UIView {
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
    
    @IBAction func movieButtonTapped(_ sender: Any) {
        let waitingView = showActivityIndicator()
        view.addSubview(waitingView)
        GenreController.grabMovieGenreList { (genre) in
            defer {
                DispatchQueue.main.async {
                    waitingView.removeFromSuperview()
                }
            }
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toGenreScreen", sender: self)
                self.genres = genre 
            }
        }
    }
    
    @IBAction func tvShowButtonTapped(_ sender: Any) {
        let waitingView = showActivityIndicator()
        view.addSubview(waitingView)
        GenreController.grabTVShowGenreList { (genre) in
            self.genres = genre
        }
    }
    
    func networkSegue() {
        
    }
    
    // Activity View
    
}
