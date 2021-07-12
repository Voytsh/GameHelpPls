//
//  PlayerModel.swift
//  Ping
//
//  Created by Filip Wojcieszak on 11/07/2021.
//

import SwiftUI

struct PlayerModel {
    var name: String = "Gracz"
    var points: Int = 0
    var setPoints: Int = 0
    var allPoints: Int = 0
    var serveFirst: Bool
    
    mutating func scorePoint() {
        points += 1
        allPoints += 1
        winSet()
            
            //otherPlayer.serves = true
        }
//    mutating func wonlastSet() {
//        if points == 11 {
//            
//        }
//    }
    
    mutating func winSet() -> Bool {
        if points == 11 {
            setPoints += 1
            points = 0
            serveFirst = false
            return true
        }
        return serveFirst 
    }
    
}
