//
//  Game.swift
//  Ping
//
//  Created by Filip Wojcieszak on 11/07/2021.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var player1 = PlayerModel(name: "Marek", serves: true)
    @Published var player2 = PlayerModel(name: "Marta", serves: false)
    
    func newNames() {
        player1.name = "new name test"
        player2.name = "new name test"
    }

    
}
