//
//  MovieDetailViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/25/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    //  MARK: - Properties
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDecriptionLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Movie?
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().tintColor = UIColor(red: 202.0/255.0, green: 78.0/255.0, blue: 80.0/255.0, alpha: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWith()
    }
    
    func updateWith() {
        guard let movie = movie else { return }
        movieTitleLabel.text = movie.originalTitle
        movieDecriptionLabel.text = movie.overview
    }
    
    //  MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)

    }
}
