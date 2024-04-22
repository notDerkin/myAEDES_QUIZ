//
//  Question.swift
//  myAEDES QUIZ
//
//  Created by Raffaele Siciliano on 22/04/24.
//

import Foundation
import SwiftUI

struct Question : Identifiable, Hashable {
    let id = UUID()
    var questionText : String
    var image : String
    var answers : [Answer]
    var correctAnswer : String
    var points : Int
}

struct Answer : Identifiable, Hashable {
    let id = UUID()
    var text : String
    var buttonColor : Color = .white
}
