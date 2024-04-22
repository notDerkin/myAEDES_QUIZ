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
        Question(questionText: "Dove si trova il colosseo?", image: "", answers: [Answer(text: "Pisa"),Answer(text: "Roma"),Answer(text: "Napoli"),Answer(text: "Milano")], correctAnswer: "Roma", points: 100),
        
        Question(questionText: "Dove si trova il colosseo?", image: "", answers: [Answer(text: "Pisa"),Answer(text: "Roma"),Answer(text: "Napoli"),Answer(text: "Milano")], correctAnswer: "Roma", points: 100),
        Question(questionText: "Dove si trova il colosseo?", image: "", answers: [Answer(text: "Pisa"),Answer(text: "Roma"),Answer(text: "Napoli"),Answer(text: "Milano")], correctAnswer: "Roma", points: 100),
        Question(questionText: "Dove si trova il colosseo?", image: "", answers: [Answer(text: "Pisa"),Answer(text: "Roma"),Answer(text: "Napoli"),Answer(text: "Milano")], correctAnswer: "Roma", points: 100),
        Question(questionText: "Dove si trova il colosseo?", image: "", answers: [Answer(text: "Pisa"),Answer(text: "Roma"),Answer(text: "Napoli"),Answer(text: "Milano")], correctAnswer: "Roma", points: 100)
        
    ]
    
    func isAnswerCorrect(_ question: Question, selectedAnswer : String) -> Bool {
        let index = questions.firstIndex { $0.id == question.id }
        if selectedAnswer == questions[index!].correctAnswer {
            print("if true")
            let secondIndex = questions[index!].answers.firstIndex { $0.text == selectedAnswer }
            questions[index!].answers[secondIndex!].buttonColor = .green
            return true
            
        } else {

            let secondIndex = questions[index!].answers.firstIndex { $0.text == selectedAnswer }
            questions[index!].answers[secondIndex!].buttonColor = .red
            return false
        }
    }
}
