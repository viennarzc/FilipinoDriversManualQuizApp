//
//  GetStartedView.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/5/23.
//

import SwiftUI

struct GetStartedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                Group {
                    Text("Welcome to Driver's License Prep")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title.bold())
                        .foregroundColor(.primary)
                    
                    Text("Your key to a confident driving experience! Prepare for your Professional or Non-Professional driver's license exam using our app")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 32)
                
            }
            
            Spacer(minLength: 48).frame(height: 64)
            
                Button(action: onTapGetStarted) {
                    Text("Let's Get Started!")
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .padding()
                        .font(.body)
                        .background(Capsule(style: .continuous).fill(Color.primary))
                }
                .buttonStyle(.plain)
                .tint(.black)

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
