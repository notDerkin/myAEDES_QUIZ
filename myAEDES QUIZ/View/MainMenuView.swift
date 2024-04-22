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
                    .frame(width: 280)
                 
                // Highscore
                    VStack {
                        Text("Highscore")
                        Text("\(questionViewModel.highscore) punti")
                    }
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(.bottom, 50)
                
                Button {
                    showQuiz.toggle()
                } label: {
                    Text("START")
                        .frame(maxWidth: screenWidth)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 20)
                }
                .buttonStyle(.borderedProminent)
                   .tint(.cyan)
                   
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showQuiz, content: {
            QuizView(showQuiz: $showQuiz)
        })
        
    }
}

#Preview {
    MainMenuView()
}
