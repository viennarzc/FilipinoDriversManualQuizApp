//
//  QuestionAnswerView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 7/26/23.
//

import SwiftUI

struct QuestionAnswerView: View {
    
    let question: String
    let answerOptions: [String]
    let correctAnswer: String
    
    @State private var selectedOption: String?
    @State private var isCorrectAnswer: Bool = false
    @State private var hasCommittedAnswer: Bool = false
    
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
                .font(.title2)
            
            Spacer(minLength: 32)
            
            VStack(spacing: 16) {
                ForEach(answerOptions, id: \.self) { item in
                    VStack {
                        Text(item)
                            .fontWeight(selectedOption == item ? .medium : .regular)
                            .foregroundColor(setOptionColor(selectedAnswer: selectedOption, equalTo: item))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(
                        cornerRadius: 8).stroke(setOptionColor(selectedAnswer: selectedOption, equalTo: item), lineWidth: selectedOption == item ? 3 : 1))
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
            .padding(.horizontal)
            
            Spacer(minLength: 64)
            
            Button(action: checkAnswer, label: {
                Text(isCorrectAnswer ? "Continue" : "Check Answer")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .font(.body.bold())
                
                
            })
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .tint(.black)
            .disabled(selectedOption == nil)
            
        }
    }
    
    private func checkAnswer() {
        hasCommittedAnswer = true
        
        if correctAnswer == selectedOption {
            isCorrectAnswer = true
        } else {
            isCorrectAnswer = false
        }
    }
}

struct QuestionAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerView(question: "What is the fastest way to drive?", answerOptions: [
            "Sleep",
            "Take a seat in the passengers seat and look around",
            "Never forget to turn on engine",
            "Wear seatbelt"
        ], correctAnswer: "Wear seatbelt")
    }
}
