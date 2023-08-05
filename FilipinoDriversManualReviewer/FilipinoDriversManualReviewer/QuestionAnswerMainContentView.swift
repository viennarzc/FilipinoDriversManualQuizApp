//
//  QuestionAnswerMainContentView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import SwiftUI

class QuestionsDataProvider: ObservableObject {
    private let service: QuestionsAPIServiceProtocol
    
    init(service: QuestionsAPIServiceProtocol) {
        self.service = service
    }
    
    func fetchQuestions() async -> ReviewSet? {
        await service.fetchQuestions()
    }
}


struct QuestionAnswerMainContentView: View {
    @StateObject private var routerPath = RouterPath()
//    @StateObject var provider = QuestionsDataProvider(service: QuestionsAPIService(questionsAPI: QuestionsAPI()))
    @StateObject var provider = QuestionsDataProvider(service: QuestionsLocalDataAPIService())
    
    @State private var selectedQ: Int = 0
    @State private var review: ReviewSet? = nil

    var body: some View {
        NavigationStack(path: $routerPath.path, root: {
            VStack {
                Spacer(minLength: 32)
                Group {
                    if let review = review {
                        Text(review.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3.bold())
                        Text(review.subtitle)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                       
                    }
                    
                }
                .padding(.horizontal)
                
                TabView(selection: $selectedQ) {
                    if let review = review {
                        ForEach(0..<(review.shuffledQuestionSet.count)) { index in
                            QuestionAnswerView(question: review.shuffledQuestionSet[index].question, answerOptions: review.shuffledQuestionSet[index].answerOptions.shuffled(), correctAnswer: review.shuffledQuestionSet[index].answer, onEvent: execute(with:))
                                .tag(index)
                                .padding(.horizontal)
                                
                        }
                        
                    }
                }
                
                if let review = review {
                    Text("\(selectedQ + 1) of \(review.shuffledQuestionSet.count)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
            }
            
            .tabViewStyle(.page(indexDisplayMode: .never))
            .task {
                let item = await provider.fetchQuestions()

                review = item
            }
            
            
        })
        

    }
    
    func execute(with event: QuestionAnswerView.CallbackEvent) {
        switch event {
        case .correctAnswer:
            break
            
        case .selectedOption:
            break
            
        case .wrongAnswer:
            break
            
        case .correctAnswerAndContinue:
            if review?.shuffledQuestionSet.count ?? 0 >= (selectedQ - 1)  {
                withAnimation {
                    selectedQ = selectedQ + 1
                    
                }
                
            }
        
        }
    }
}

struct QuestionAnswerMainContentView_Previews: PreviewProvider {
    
    class MockQuestionsAPIService: QuestionsAPIServiceProtocol {
        func fetchQuestions() async -> ReviewSet? {
            return ReviewSet(title: "Title", subtitle: "Subtitle", yearEdition: 2023, driversLicenseCode: ["B1, B"], generalDesc: "Non Prof", list: [
                QuestionListItem(answer: "A", question: "Who is batman", answerOptions: [
                    AnswerOption(code: "A", desc: "Bruce"),
                    AnswerOption(code: "B", desc: "Jane")
                ]),
                QuestionListItem(answer: "C", question: "What does the fox say?", answerOptions: [
                    AnswerOption(code: "A", desc: "Hihihi"),
                    AnswerOption(code: "B", desc: "Whwohow"),
                    AnswerOption(code: "C", desc: "Hieeeee"),
                    AnswerOption(code: "D", desc: "Hassssss"),
                ]),
            ])
        }
        
        
    }
    
    static var previews: some View {
        QuestionAnswerMainContentView(provider: QuestionsDataProvider(service: MockQuestionsAPIService()))
    }
}


public struct QuestionItem: Decodable, Equatable, Hashable {
    let id: Int
    let question: String
    let options: [String]
    let answer: String
}
