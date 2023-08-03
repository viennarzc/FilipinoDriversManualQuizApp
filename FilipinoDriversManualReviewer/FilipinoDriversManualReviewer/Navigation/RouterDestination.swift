//
//  RouterDestination.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import Foundation

public enum RouterDestination: Hashable, Equatable {
    
    case questionAnswer(item: QuestionItem)
    
}


@MainActor
extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: RouterDestination.self) { destination in
            switch destination {
            case .questionAnswer(let item):
                QuestionAnswerView(question: item.question, answerOptions: item.options , correctAnswer: item.answer)
            }
        }
    }
}
