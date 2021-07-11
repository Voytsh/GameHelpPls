//
//  SettingsView.swift
//  Ping
//
//  Created by Filip Wojcieszak on 11/07/2021.
//

import SwiftUI

struct SettingsView: View {
    let hh = UIScreen.main.bounds.height
    @State var p1TF: String = ""
    @State var savedTF1: String = ""
    @Binding var showSettings: Bool
    @EnvironmentObject var mainViewModel: MainViewModel


    var body: some View {
        ZStack{
            //background
            Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            Color(#colorLiteral(red: 0.8712900281, green: 0.8510302901, blue: 0.1147780493, alpha: 1))
                //.frame(maxWidth: hh*0.9, maxHeight: hh*0.9)
                .cornerRadius(25)
                .padding()
            
            VStack {
                TextField("New Player1 Name", text: $p1TF)
                    .foregroundColor(.primary)
                    .padding()
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(15)
                
                Button(action: {
                    savedTF1 = p1TF
                    //mainViewModel.player1.name = savedTF1
                    mainViewModel.newNames()
                    //mainViewModel.player2.name = savedTF1
                    
                }, label: {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(15)
                })
                Text(savedTF1)
                
                Button(action: {
                    showSettings = false
                }, label: {
                    Text("Dismiss")
                        .padding()
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .background(Color.white)
                        .cornerRadius(15)
                })
            }
            .padding(50)
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
