//
//  QuestionViewModel.swift
//  myAEDES QUIZ
//
//  Created by Raffaele Siciliano on 22/04/24.
//

import Foundation
import SwiftUI

class QuestionViewModel : ObservableObject {
    static var shared = QuestionViewModel()
    
    @AppStorage("highscore") var highscore = 0
    
    @Published var questions : [Question] = [
        Question(questionText: "Dove si trova il Colosseo?", image: "colosseo", answers: [Answer(text: "Pisa"),Answer(text: "Roma"),Answer(text: "Napoli"),Answer(text: "Milano")], correctAnswer: "Roma", points: 100),
        
        Question(questionText: "Dove si trova la Sagrada Familia?", image: "sagradaFamilia", answers: [Answer(text: "Madrid"),Answer(text: "Siviglia"),Answer(text: "Valencia"),Answer(text: "Barcellona")], correctAnswer: "Barcellona", points: 100),
        
        Question(questionText: "Dove si trova il Burj Khalifa?", image: "burj", answers: [Answer(text: "Dubai"),Answer(text: "Abu Dhabi"),Answer(text: "Sharja"),Answer(text: "Al Ain")], correctAnswer: "Dubai", points: 100),
        
        Question(questionText: "Dove si trova lo Stonehenge?", image: "stonehenge", answers: [Answer(text: "Scozia"),Answer(text: "Inghilterra"),Answer(text: "Irlanda"),Answer(text: "Galles")], correctAnswer: "Inghilterra", points: 100),
        Question(questionText: "Dove si trova il Golden Gate?", image: "goldenGate", answers: [Answer(text: "Los Angeles"),Answer(text: "San Jose"),Answer(text: "Oakland"),Answer(text: "San Francisco")], correctAnswer: "San Francisco", points: 100)
        
    ]
    
    func isAnswerCorrect(question: Question, selectedAnswer : String) -> Bool {
        let index = questions.firstIndex { $0.id == question.id }
        if selectedAnswer == questions[index!].correctAnswer {
            print("if true")
            let secondIndex = questions[index!].answers.firstIndex { $0.text == selectedAnswer }
            questions[index!].answers[secondIndex!].buttonColor = .green
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.questions[index!].answers[secondIndex!].buttonColor = .white
            })
            return true
            
        } else {

            let secondIndex = questions[index!].answers.firstIndex { $0.text == selectedAnswer }
            questions[index!].answers[secondIndex!].buttonColor = .red
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.questions[index!].answers[secondIndex!].buttonColor = .white
            })
            return false
        }
    }
    
//    func resetAnswerColor(question: Question) {
//        let index = questions.firstIndex { $0.id == question.id }
//        let secondIndex = questions[index!].answers.firstIndex { $0.text == selectedAnswer }
//        questions[index!].answers[secondIndex!].buttonColor = .white
//        
//    }
}
