//
//  Genre.swift
//  Capstone
//
//  Created by Nicholas Ellis on 1/25/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class Genre {
    
    fileprivate let kID = "id"
    fileprivate let kName = "name"
    
    var id: Int?
    var name: String?
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    init?(jsonDictionary: [String : Any]) {
        guard let id = jsonDictionary[kID] as? Int,
            let name = jsonDictionary[kName] as? String else {
                return
        }
        self.id = id
        self.name = name
    }
}
