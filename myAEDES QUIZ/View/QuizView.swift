//
//  QuizView.swift
//  myAEDES QUIZ
//
//  Created by Raffaele Siciliano on 22/04/24.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var questionViewModel : QuestionViewModel
    
    @Binding var showQuiz : Bool
    
    @State var questionNumber = 0
    @State var actualScore = 0
    
    @State var isSelected : Bool = false
    @State var showAlert : Bool = false
    
    func changeQuestion() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if questionNumber < questionViewModel.questions.count-1 {
                questionNumber += 1
            } else if questionNumber == questionViewModel.questions.count-1 {
                
                // Aggiorniamo il punteggio massimo se quello attuale è maggiore
                if questionViewModel.highscore < actualScore {
                    questionViewModel.highscore = actualScore
                }
                showQuiz = false
            }
        })
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea(.all)
            
            // Header
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.white)
                    Text("Domanda \(questionNumber + 1)/\(questionViewModel.questions.count) - Punteggio Attuale : \(actualScore)")
                        .foregroundStyle(Color.backgroundColor)
                        .padding()
                }
                .frame(width: screenWidth, height: 40)
                Spacer()
            }
            VStack {
                // Area Domanda
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.white)
                    VStack {
                        Text("\(questionViewModel.questions[questionNumber].points) Punti")
                            .foregroundStyle(Color.green)
                        Image(questionViewModel.questions[questionNumber].image)
                        HStack {
                            Text(questionViewModel.questions[questionNumber].questionText)
                            Spacer()
                        }
                        .padding(.horizontal, 25)
                    }
                }
                .frame(width: screenWidth, height: 300)
                .padding(.horizontal, 15)
                
                // Risposte
                VStack {
                    ForEach(questionViewModel.questions[questionNumber].answers, id: \.self) { answer in
                        Button {if
                            questionViewModel.isAnswerCorrect(questionViewModel.questions[questionNumber], selectedAnswer: answer.text) {
                            actualScore += questionViewModel.questions[questionNumber].points
                            changeQuestion()
                        } else {
                            showAlert.toggle()
                            changeQuestion()
                        }
                        } label: {
                            Text(answer.text)
                                .foregroundStyle(Color.black)
                        }
                        .frame(width: screenWidth)
                        .buttonStyle(.borderedProminent)
                        .tint(answer.buttonColor)
                    }
                    
                }
                .padding(.horizontal, 15)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Risposta errata!"), message: Text("La risposta corretta era '\(questionViewModel.questions[questionNumber].correctAnswer)'."), dismissButton: .default(Text("Ok")))
                    }
        }
    }
}

//#Preview {
//    QuizView()
//}
