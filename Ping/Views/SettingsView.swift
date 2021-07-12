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
    
    let setTo: [SetTo] = [SetTo("3"), SetTo("5"), SetTo("7"), SetTo("11"), SetTo("15"), SetTo("25"), SetTo("50"), SetTo("100")]
    let gameTo: [GameTo] = [GameTo("1"), GameTo("2"), GameTo("3"), GameTo("5")]

    
    @State var selectSetTo: String = "11"
    @State var setToWasChange: Bool = false
    @State var selectGameTo: String = "5"
    
//MARK: BODY
    
    var body: some View {
        ZStack{
            //background
            Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            Color(#colorLiteral(red: 0.8712900281, green: 0.8510302901, blue: 0.1147780493, alpha: 1))
                .cornerRadius(25)
                .padding()
            
            VStack(spacing: 15.0) {
                buttonLayer
                tfLayer
                pickersLayer
                Spacer()
            }
            .padding(50)
        }
    }
    
}


extension SettingsView {
    

    
    //MARK: METHODS
    
    func canSave() -> Bool {
        if p1TF.count > 2 || p2TF.count > 2 || setToWasChange {
            return true
        } else {
            return false
        }
            
    }
    
    func saveChanges() {
        if canSave() {
            if p1TF.count > 2 {
                mainViewModel.player1.name = p1TF
            }
            if p2TF.count > 2 {
                mainViewModel.player2.name = p2TF
            }
            if setToWasChange {
                setToWasChange = false
            }
            mainViewModel.player1.needsToWinSet = Int(selectSetTo) ?? 11
            mainViewModel.player2.needsToWinSet = Int(selectSetTo) ?? 11
//            mainViewModel.player1.needsToWinGame = Int(selectSetTo) ?? 11
//            mainViewModel.player2.needsToWinGame = Int(selectSetTo) ?? 11
            
        }
    }
    
    //MARK: LAYERS
    
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
                    .foregroundColor(canSave() ? Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)) : Color.gray)
                    .font(.subheadline)
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(canSave() ? Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)) : Color.gray, lineWidth: 1)
                        )
            })
        }
    }
    
    var tfLayer: some View {
        VStack(spacing: 15) {
            TextField("New Player1 Name", text: $p1TF)
                .foregroundColor(.primary)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("C1"), lineWidth: 3)
                    )
                .multilineTextAlignment(.center)
            
            TextField("New Player2 Name", text: $p2TF)
                .foregroundColor(.primary)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("C2"), lineWidth: 3)
                )
                .multilineTextAlignment(.center)
        }
    }
    
    var pickersLayer: some View {
        VStack{
            Picker(selection: $selectSetTo,
                   label:
                    HStack{
                        Text("Play set to \(selectSetTo) points")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                            .font(.headline)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), lineWidth: 1)
                                )
                    }
                   ,
                   content: {
                    ForEach(setTo) {num in
                        Text(String(num.points))
                            .tag(String(num.points))
                    }
                   }
            )
            .pickerStyle(MenuPickerStyle())
            .onChange(of: selectSetTo, perform: { _ in
                setToWasChange = true
            })
            
            
//            Picker(selection: $selectGameTo,
//                   label:
//                    HStack{
//                        Text("Play game to \(selectGameTo) sets")
//                            .padding()
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
//                            .font(.headline)
//                            .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), lineWidth: 1)
//                                )
//                    }
//                   ,
//                   content: {
//                    ForEach(gameTo) {num in
//                        Text(String(num.points))
//                            .tag(String(num.points))
//                    }
//                   }
//            )
//            .pickerStyle(MenuPickerStyle())
            
        }
    }
    
}

struct SetTo: Identifiable {
    let id = UUID()
    let points: String
    
    init(_ points: String) {
        self.points = points
    }
}

struct GameTo: Identifiable {
    let id = UUID()
    let points: String
    
    init(_ points: String) {
        self.points = points
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
