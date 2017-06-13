//
//  GameLibrary.swift
//  MVVMExample
//
//  Created by Dino Bartosak on 18/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import Foundation

enum GameLibraryNotifications {
    static let GameLibraryGameAdded    = "GameLibraryGameAdded"
    static let GameLibraryGameRemoved  = "GameLibraryGameRemoved"
    static let GameLibraryGameUpdated  = "GameLibraryGameUpdated"
}

protocol GameLibrary {
    func allGames() -> [Game]
    func addGame(_ game: Game) // posts GameLibraryGameAdded notifications
    func removeGame(_ game: Game) // posts GameLibraryGameRemoved notifications
    func updateGame(_ game: Game) // posts GameLibraryGameUpdated notifications
}
