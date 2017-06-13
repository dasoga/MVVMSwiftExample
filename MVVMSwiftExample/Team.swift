//
//  Team.swift
//  MVVMExample
//
//  Created by Dino Bartosak on 15/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import Foundation

class Team: NSObject {
    
    let identifier: String
    var name: String
    var players: [Player]
    
    init(name: String, identifier: String) {
        self.name = name
        self.identifier = identifier
        self.players = []
    }
    
    func addPlayer(_ player: Player) {
        self.players.append(player)
    }

    func containsPlayer(_ player: Player) -> Bool {
        var contains: Bool = false
        for currentPlayer in players {
            if currentPlayer.identifier == player.identifier {
                contains = true
                break
            }
        }
        
        return contains
    }
    
}
