//
//  GetStartedView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/5/23.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Group {
                    Text("Learn and Prepare")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title.bold())
                        .foregroundColor(.primary)
                    
                    Text("Learn by taking quizes to help you prepare for the license examination")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 16)
                
            }
            
            Spacer(minLength: 32).frame(height: 64)
            
            VStack(spacing: 4){
                
                Button(action: onTapGetStarted) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding()
                        .font(.body)
                        .background(Capsule(style: .continuous).fill(Color.black))
                }
                .buttonStyle(.plain)
                .tint(.black)

            }
            
        }
    }
    
    func onTapGetStarted() {
        
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
