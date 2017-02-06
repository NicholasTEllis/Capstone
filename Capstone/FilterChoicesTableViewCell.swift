//
//  FilterChoicesTableViewCell.swift
//  Capstone
//
//  Created by Nicholas Ellis on 2/1/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class FilterChoicesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func updateWith(genre: Genre) {
        titleLabel.text = genre.name
    }
}

