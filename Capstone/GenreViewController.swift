//
//  GenreViewController.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/31/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    static var isMovie: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().tintColor = UIColor(red: 202.0/255.0, green: 78.0/255.0, blue: 80.0/255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GenreController.genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as? FilterChoicesTableViewCell else {
            return UITableViewCell()
        }
        
        let genre = GenreController.genres[indexPath.row]
        cell.updateWith(genre: genre)
        if genre.isSelected {
            cell.accessoryType = .checkmark
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .bottom)
        } else {
            cell.accessoryType = .none
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genres = GenreController.genres[indexPath.row]
        genres.isSelected = true
        if let id = genres.id {
            GenreController.genreRowIDs.append(id)
            NSLog("\(GenreController.genreRowIDs)")
        }
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let genres = GenreController.genres[indexPath.row]
        genres.isSelected = false
        if let id = genres.id {
            guard let index = GenreController.genreRowIDs.index(of: id) else { return }
            GenreController.genreRowIDs.remove(at: index)
            NSLog("\(GenreController.genreRowIDs)")
        }
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        tableView.endUpdates()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if GenreViewController.isMovie == true {
            LoadingOverlay.shared.showOverlay(view: view)
            MovieController.discoverMovies { (movie) in
                DispatchQueue.main.async {
                    LoadingOverlay.shared.hideOverlayView()
                }
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toResultsScreen", sender: self)
                }
            }
            
        } else if GenreViewController.isMovie == false {
            TVShowController.discoverTVShows { (tvShow) in
                DispatchQueue.main.async {
                    LoadingOverlay.shared.hideOverlayView()                    
                }
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toResultsScreen", sender: self)
                }
            }
            
        }
    }
}
