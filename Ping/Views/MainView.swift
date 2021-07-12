//
//  MainView.swift
//  Ping
//
//  Created by Filip Wojcieszak on 11/07/2021.
//

import SwiftUI

struct MainView: View {
    let hh = UIScreen.main.bounds.height
    let ww = UIScreen.main.bounds.width
    var startsTheGame: Bool = false
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var showSettings: Bool = false
    
        var body: some View {
            ZStack{
                //background
                Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                
                //Text content
                VStack(spacing: 0){
                    //P1
                    ZStack{
                        PlayerView(Color("C1"), player: $mainViewModel.player1)
                            .padding(15)
                        Image(systemName: (mainViewModel.p1Serves() ? "s.circle": ""))
                        //Image(systemName: (mainViewModel.p1Serves(mainViewModel.player1.winSet())) ? "s.circle": "")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: ww/8, maxHeight: hh/8)
                            .padding(ww/6)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                    
                    //settings&info
                    midSection
                    
                    //P2
                    ZStack{
                        PlayerView(Color("C2"), player: $mainViewModel.player2)
                            .padding(15)
//                        Image(systemName: (!mainViewModel.p1Serves(mainViewModel.player1.winSet())) ? "s.circle": "")
                        Image(systemName: (!mainViewModel.p1Serves() ? "s.circle": ""))
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: ww/8, maxHeight: hh/8)
                            .padding(ww/6)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                    
                }
                
                //serveLayer
                
            }
            .sheet(isPresented: $showSettings, content: {
                SettingsView(showSettings: $showSettings)
            })
        }
}
extension MainView {
    var midSection: some View {
        HStack{
            Button(action: {
                showSettings.toggle()
            }, label: {
                Image(systemName: "gearshape")
                    .padding(.all, 2)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9843137255, blue: 0, alpha: 1)))
            })
            .padding(.horizontal)
            
            Button(action: {
                //showingSettings.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .padding(.all, 2)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9843137255, blue: 0, alpha: 1)))
            })
            .padding(.horizontal)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}


//        var showSettingsLayer: some View {
//            ZStack{
//                if showSettings {
//                    SettingsView()
//    //                    SettingsView(showingSettings: $showingSettings)
//    //                        .transition(.move(edge: .bottom))
//    //                        .animation(.default)
//
//                }
//            }.zIndex(2.0)
//        }
