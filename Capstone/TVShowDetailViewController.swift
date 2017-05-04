//
//  TVShowDetailViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/25/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class TVShowDetailViewController: UIViewController {
    
    //  MARK: - Properties

    @IBOutlet weak var tvShowTitleLabel: UILabel!
    @IBOutlet weak var tvShowDescriptionLabel: UILabel!
    @IBOutlet weak var tvShowImage: UIImageView!
    
    var tvShow: TVShow?
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().tintColor = UIColor(red: 202.0/255.0, green: 78.0/255.0, blue: 80.0/255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWith()
    }

    func updateWith() {
        guard let tvShow = tvShow else {
            return
        }
        
        tvShowTitleLabel.text = tvShow.originalTitle
        tvShowDescriptionLabel.text = tvShow.overview
    }
    
    //  MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)

    }

}
