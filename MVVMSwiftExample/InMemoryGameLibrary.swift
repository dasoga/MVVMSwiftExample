//
//  InMemoryGameLibrary.swift
//  MVVMExample
//
//  Created by Dino Bartosak on 18/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import Foundation

class InMemoryGameLibrary: NSObject, GameLibrary {
    
    fileprivate var games: [Game] = []
    
    override init() {
        super.init()

        // add some teams
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
        addDummyGame()
    }
    
    fileprivate func addDummyGame() {
        let homeTeam: Team = Team(name: "Ballerz", identifier: UUID().uuidString)
        homeTeam.addPlayer(Player(name: "Shaq", identifier: UUID().uuidString))
        homeTeam.addPlayer(Player(name: "A.I.", identifier: UUID().uuidString))
        homeTeam.addPlayer(Player(name: "T-Mac", identifier: UUID().uuidString))
        
        let awayTeam: Team = Team(name: "Ringerz", identifier: UUID().uuidString)
        awayTeam.addPlayer(Player(name: "Hakeem", identifier: UUID().uuidString))
        awayTeam.addPlayer(Player(name: "Air Carter", identifier: UUID().uuidString))
        awayTeam.addPlayer(Player(name: "Kobe", identifier: UUID().uuidString))
        
        let game: Game = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: UUID().uuidString)
        self.games.append(game)
    }
    
    // MARK: GameLibrary Protocol
    
    func allGames() -> [Game] {
        return games
    }
    
    func addGame(_ game: Game) {
        for currentGame in games {
            if currentGame.identifier == game.identifier {
                return
            }
        }
        
        games.append(game)
        NotificationCenter.default.post(notification(GameLibraryNotifications.GameLibraryGameAdded, game: game))
    }
    
    func removeGame(_ game: Game) {
        var indexToRemove: Int?
        for index in 0...games.count-1 {
            let currentGame = games[index]
            if currentGame.identifier == game.identifier {
                indexToRemove = index
                break
            }
        }
        
        if let indexToRemove = indexToRemove {
            games.remove(at: indexToRemove)
            NotificationCenter.default.post(notification(GameLibraryNotifications.GameLibraryGameRemoved, game: game))
        }
    }
    
    func updateGame(_ game: Game) {
        var existingGame: Game?
        for currentGame in games {
            if currentGame.identifier == game.identifier {
                existingGame = currentGame
                break
            }
        }
        
        if let existingGame = existingGame {
            existingGame.homeTeam = game.homeTeam
            existingGame.awayTeam = game.awayTeam
            existingGame.homeTeamScore = game.homeTeamScore
            existingGame.awayTeamScore = game.awayTeamScore
            
            NotificationCenter.default.post(notification(GameLibraryNotifications.GameLibraryGameUpdated, game: existingGame))
        }
    }
    
    // MARK: Private
    
    fileprivate func notification(_ name: String, game: Game) -> Notification {
        let notification: Notification = Notification(name: Notification.Name(rawValue: name), object: self, userInfo: ["game" : game])
        
        return notification
    }
    
}
