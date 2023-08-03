//
//  QuestionAnswerMainContentView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import SwiftUI

struct QuestionAnswerMainContentView: View {
    @StateObject private var routerPath = RouterPath()
    @StateObject private var service = QuestionsAPIService(questionsAPI: QuestionsAPI())
    
    @State private var selectedQ: Int = 0
    @State private var review: ReviewSet? = nil

    var body: some View {
        NavigationStack(path: $routerPath.path, root: {
            TabView(selection: $selectedQ) {
                if let review = review {
                    ForEach(review.list) { item in
                        QuestionAnswerView(question: item.question, answerOptions: item.answerOptions, correctAnswer: item.answer)
                    }
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .task {
                let item = await service.fetchQuestions()

                review = item
            }
            
            
        })
        

    }
}

struct QuestionAnswerMainContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerMainContentView()
    }
}


public struct QuestionItem: Decodable, Equatable, Hashable {
    let id: Int
    let question: String
    let options: [String]
    let answer: String
}
