//
//  TVShowDetailViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/25/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class TVShowDetailViewController: UIViewController {

    @IBOutlet weak var tvShowTitleLabel: UILabel!
    @IBOutlet weak var tvShowDescriptionLabel: UILabel!
    
    var tvShow: TVShow?
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().tintColor = UIColor(red: 202.0/255.0, green: 78.0/255.0, blue: 80.0/255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func updateWith() {
        guard let tvShow = tvShow else {
            return
        }
        
        tvShowTitleLabel.text = tvShow.originalTitle
        tvShowDescriptionLabel.text = tvShow.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
