//
//  Player.swift
//  MVVMExample
//
//  Created by Dino Bartosak on 15/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    let identifier: String
    var name: String
    
    init(name: String, identifier: String) {
        self.name = name
        self.identifier = identifier
    }
}
