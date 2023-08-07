//
//  ChooseReviewSetView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/7/23.
//

import SwiftUI

struct ChooseReviewSetView: View {
    @Environment(\.colorScheme) var colorScheme
    
    enum Set {
        case nonProfessional
        case professional
    }
    
    @State private var selectedSet: Set?
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                Group {
                    Text("Select Your Review Set")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title.bold())
                        .foregroundColor(.primary)
                    
                    Text("Choose the review set that matches the type of driver's license you're preparing for.")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.secondary)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Text("Non-professional")
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Professional")
                        }

                    }
                }
                .padding(.horizontal, 32)
                
            }
            
            Spacer(minLength: 48).frame(height: 64)
            
                Button(action: onTapGetStarted) {
                    Text("Continue")
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .padding()
                        .font(.body.weight(.medium))
                        .background(Capsule(style: .continuous).fill(Color.primary))
                }
                .buttonStyle(.plain)
                .tint(.black)
            
            Button(action: onTapGetStarted) {
                Text("I'll take the quizzes later")
                    .padding()
                    .font(.body)
                    
            }
            .buttonStyle(.plain)
            .tint(.black)

        }
    
    }
    
    func onTapGetStarted() {
        
    }
}

struct ChooseReviewSetView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseReviewSetView()
    }
}
