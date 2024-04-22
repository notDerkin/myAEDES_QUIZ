//
//  MainMenuView.swift
//  myAEDES QUIZ
//
//  Created by Raffaele Siciliano on 22/04/24.
//

import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var questionViewModel : QuestionViewModel
    @State var showQuiz : Bool = false
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                Image("logo_myaedes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                 
                // Highscore
                if questionViewModel.highscore != 0 {
                    VStack {
                        Text("Highscore")
                        Text("\(questionViewModel.highscore) punti")
                    }
                    .foregroundStyle(Color.white)
                }
                Button {
                    showQuiz.toggle()
                } label: {
                    Text("START")
                        .foregroundStyle(Color.white)
                }
                .buttonStyle(.borderedProminent)
                   .tint(.cyan)
                   .frame(width: screenWidth)
            }
        }
        .fullScreenCover(isPresented: $showQuiz, content: {
            QuizView(showQuiz: $showQuiz)
        })
        
    }
}

#Preview {
    MainMenuView()
}
