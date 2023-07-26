//
//  QuestionAnswerView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 7/26/23.
//

import SwiftUI

struct QuestionAnswerView: View {
    var body: some View {
        VStack {
            Text("What is the fastest way to drive?")
                .font(.title2)
            
            Spacer(minLength: 32)
            
            VStack {
                
            }
            
            Button(action: {
                
            }, label: {
                Text("Check Answer")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .font(.body.bold())
                
            })
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            
        }
    }
}

struct QuestionAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerView()
    }
}
