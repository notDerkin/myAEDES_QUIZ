//
//  myAEDES_QUIZApp.swift
//  myAEDES QUIZ
//
//  Created by Raffaele Siciliano on 22/04/24.
//

import SwiftUI

@main
struct myAEDES_QUIZApp: App {
    @StateObject var questionViewModel = QuestionViewModel.shared
    var body: some Scene {
        WindowGroup {
            MainMenuView().environmentObject(questionViewModel)
        }
    }
}
