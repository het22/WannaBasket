//
//  GameTest.swift
//  WannaBasketTests
//
//  Created by Het Song on 09/07/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import XCTest
@testable import WannaBasket

class GameTest: XCTestCase {

    var game: Game!

    override func setUp() {
        let homeTeam = Team(name: "TeamA")
        homeTeam.players.append(contentsOf: [
                Player(name: "PlayerA"),
                Player(name: "PlayerB")
            ])
        let awayTeam = Team(name: "TeamB")
        awayTeam.players.append(contentsOf: [
            Player(name: "PlayerC"),
            Player(name: "PlayerD")
            ])
        game = Game(homeTeam: homeTeam, awayTeam: awayTeam)
    }
    
    func testGetScore() {
        game.addRecords(playerTuple: (true, 0), stat: .Two)
        game.addRecords(playerTuple: (false, 0), stat: .Three)
        game.addRecords(playerTuple: (true, 1), stat: .Two)
        game.addRecords(playerTuple: (true, 1), stat: .One)
        XCTAssertEqual(game.scores.home, 5)
        XCTAssertEqual(game.scores.away, 3)
    }
}
