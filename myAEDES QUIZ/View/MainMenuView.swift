//
//  MainMenuView.swift
//  myAEDES QUIZ
//
//  Created by Raffaele Siciliano on 22/04/24.
//

import SwiftUI

struct MainMenuView: View {
    @State var showQuiz : Bool = false
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea(.all)
            VStack {
                Image("")
                    .resizable()
                    .scaledToFit()
                 
                // Highscore
                
                Button {
                    showQuiz.toggle()
                } label: {
                    Text("START")
                        .foregroundStyle(Color.white)
                }
                .buttonStyle(.borderedProminent)
                   .tint(.cyan)
            }
        }
        
    }
}

#Preview {
    MainMenuView()
}
