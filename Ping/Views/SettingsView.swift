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
    @State var p2TF: String = ""
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
            
            VStack(spacing: 15.0) {
                buttonLayer
                tfLayer
                Spacer()
            }
            .padding(50)
        }
    }
    
    var buttonLayer: some View {
        HStack {
            Button(action: {
                showSettings = false
            }, label: {
                Text("Back to game")
                    .padding()
                    .foregroundColor(Color(#colorLiteral(red: 0.8712900281, green: 0.8510302901, blue: 0.1147780493, alpha: 1)))
                    .font(.subheadline)
                    .background(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                    .cornerRadius(15)
                    
            })
            
            Spacer()
            
            Button(action: {
                saveChanges()
                
            }, label: {
                Text("Save")
                    .padding()
                    .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                    .font(.subheadline)
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), lineWidth: 1)
                        )
            })
        }
    }
    
    var tfLayer: some View {
        VStack(spacing: 15) {
            TextField("New Player1 Name", text: $p1TF)
                .foregroundColor(.primary)
                .padding()
                //.background(Color.gray.opacity(0.6))
                //.cornerRadius(15)
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("C1"), lineWidth: 3)
                    )
            
            TextField("New Player2 Name", text: $p2TF)
                .foregroundColor(.primary)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("C2"), lineWidth: 3)
                )
        }
    }
    
    func saveChanges() {
        if p1TF.count > 2 {
            mainViewModel.player1.name = p1TF
        }
        if p2TF.count > 2 {
            mainViewModel.player2.name = p2TF
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
