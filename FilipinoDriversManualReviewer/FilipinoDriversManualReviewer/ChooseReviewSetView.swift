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
    
    private var disableContinue: Bool {
        (selectedSet == nil) || selectedSet == .professional
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                Group {
                    Text("Test your knowledge now!")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                    
                    Text("Choose the **review** set that matches the type of driver's license you're preparing for.")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.secondary)
                    
                    VStack {
                        Button {
                            withAnimation {
                                selectedSet = .nonProfessional
                                
                            }
                            
                        } label: {
                            VStack {
                                Text("Non-professional")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .fontWeight(.regular)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(8)
                                    
                                
                                if selectedSet == .nonProfessional {
                                    Text("Designed for those pursuing a Non-Professional driver's license, this review set focuses on essential road signs and rules for everyday driving.")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .foregroundColor(.secondary)
                                        .font(Font.footnote)
                                        .padding([.horizontal, .bottom], 16)
                                }

                                
                            
                            }
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(selectedSet == .nonProfessional ? .primary : .secondary))
                        }
                        
                        
                        Button {
                            withAnimation {
                                selectedSet = .professional
                                
                            }
                            
                        } label: {
                            VStack {
                                Text("Professional")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .fontWeight(.regular)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(8)
                                
                                
                                if selectedSet == .professional {
                                    Text("Unavailable")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .foregroundColor(.secondary)
                                        .font(Font.footnote)
                                        .padding([.horizontal, .bottom], 16)
                                }
                                
                            }
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(selectedSet == .professional ? .primary : .secondary))
                        }
                        

                    }
                    .tint(.secondary)
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
                .disabled(disableContinue)
            
            Button(action: onTapGetStarted) {
                Text("I'll take the quizzes later")
                    .padding()
                    .font(.caption2.weight(.bold))
                    
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
