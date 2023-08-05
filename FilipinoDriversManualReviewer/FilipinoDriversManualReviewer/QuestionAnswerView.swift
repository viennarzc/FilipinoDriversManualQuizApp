//
//  QuestionAnswerView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 7/26/23.
//

import SwiftUI
import Combine

struct QuestionAnswerView: View {
    
    let question: String
    let answerOptions: [AnswerOption]
    let correctAnswer: String
    
    @State private var selectedOption: AnswerOption?
    @State private var isCorrectAnswer: Bool = false
    @State private var hasCommittedAnswer: Bool = false
    
    enum CallbackEvent {
        case correctAnswer
        case correctAnswerAndContinue
        case wrongAnswer
        case selectedOption
    }
    
    enum QuestionAnswerState {
        case idle
        case correctAnswer
        case wrongAnswer
        case correctAnswerAndFinish
    }
    
    @State private var questionAndAnswerState: QuestionAnswerState = .idle {
        didSet {
            debugPrint("old valude for state: ",oldValue)
            debugPrint("new value state: ", questionAndAnswerState)
            
            if oldValue == .correctAnswer, questionAndAnswerState == .correctAnswer {
                onEvent(.correctAnswerAndContinue)
            }
        }
    }
    
    var onEvent: (CallbackEvent) -> Void
    
    @State private var observers: [AnyCancellable] = []
    
    func setOptionColor(selectedAnswer: String?, equalTo current: String) -> Color {
        guard let selectedAnswer = selectedAnswer else {
            return .gray
        }
        
        if !hasCommittedAnswer, !isCorrectAnswer, selectedAnswer == current {
            return .black
        }
        
        if hasCommittedAnswer, !isCorrectAnswer, selectedAnswer == current {
            return .red
        }
        
        if isCorrectAnswer, selectedAnswer == current {
            return .green
        }
        
        return .gray
    }
    
    var body: some View {
        VStack {
            Text(question)
                .font(.title2.bold())
            
            Spacer(minLength: 32)
            
            VStack(spacing: 16) {
                ForEach(answerOptions) { item in
                    VStack {
                        Text(item.desc)
                            .fontWeight(selectedOption == item ? .medium : .regular)
                            .foregroundColor(setOptionColor(selectedAnswer: selectedOption?.code, equalTo: item.code))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(
                        cornerRadius: 8).stroke(setOptionColor(selectedAnswer: selectedOption?.code, equalTo: item.code), lineWidth: selectedOption == item ? 3 : 1))
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedOption = item
                    }
                }
                .disabled(isCorrectAnswer)
                .onChange(of: selectedOption) { newValue in
                    hasCommittedAnswer = false
                }
            }
            
            
            Spacer(minLength: 64)
            
            Button(action: checkAnswer, label: {
                Text(isCorrectAnswer ? "Continue" : "Check Answer")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .font(.body.bold())
                
                
            })
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .disabled(selectedOption == nil)
            
        }

    }
    
    private func checkAnswer() {
        hasCommittedAnswer = true
        
        guard let selectedOption = selectedOption else { return }
        
        if correctAnswer == selectedOption.code {
            isCorrectAnswer = true
            questionAndAnswerState = .correctAnswer
            onEvent(.correctAnswer)
            
        } else {
            isCorrectAnswer = false
            questionAndAnswerState = .wrongAnswer
            onEvent(.wrongAnswer)
        }
        
    }
}

struct QuestionAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerView(question: "What is the fastest way to drive?", answerOptions: [
            AnswerOption(code: "A", desc: "The who")
        ], correctAnswer: "Wear seatbelt", onEvent: { _ in })
    }
}
