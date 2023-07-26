//
//  FilipinoDriversManualReviewerApp.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 7/26/23.
//

import SwiftUI

@main
struct FilipinoDriversManualReviewerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
