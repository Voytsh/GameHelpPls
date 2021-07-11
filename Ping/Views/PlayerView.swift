//
//  PlayerView.swift
//  PingPongScoreboard
//
//  Created by Filip Wojcieszak on 11/07/2021.
//

import SwiftUI

struct PlayerView: View {
    let hh = UIScreen.main.bounds.height
    let playerBackgroundColor: Color
    @State var player: PlayerModel 
    
    
    init(_ playerBackgroundColor: Color, player: PlayerModel) {
        self.playerBackgroundColor = playerBackgroundColor
        self.player = player
    }
    
    var body: some View {
        ZStack {
            playerBackgroundColor
                .cornerRadius(15)
            
            //serveImage content
//            serveLabel
//                //.opacity(0.5)
//                .opacity(player.serves ? 1 : 0)
            
            // text content
            VStack{
                nameLabel
                pointsLabel
                setPointsLabel
                allPointsLabel
            }
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
            .onTapGesture {
                player.scorePoint()
            }
        }
    }
}


//MARK: LABELS Extension

extension PlayerView {
    
    var nameLabel: some View {
        Text(String(player.name))
            .font(.system(size: hh/20))
            .fontWeight(.ultraLight)
    }
    
    var pointsLabel: some View {
        Text(String(player.points))
            .font(.system(size: hh/6))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
    var setPointsLabel: some View {
        Text(String(player.setPoints))
            .font(.system(size: hh/15))
            .fontWeight(.light)
    }
    
    var allPointsLabel: some View {
        Text(String(player.allPoints))
            .font(.system(size: hh/40))
            .fontWeight(.thin)
    }
    
    var serveLabel: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "s.circle")
                    .resizable()
                    .frame(maxWidth: hh/10, maxHeight: hh/10, alignment: .leading)
                    .scaledToFit()
                    .padding()
                Spacer()
            }
            .padding()
            
        }
    }
    
    
}

//struct PlayerView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        PlayerView(Color("C1"), player: PlayerModel(startsTheGame: <#Binding<Bool>#>, name: "Player1", points: 8, setPoints: 4, allPoints: 47, didStart: true))
//    }
//}
