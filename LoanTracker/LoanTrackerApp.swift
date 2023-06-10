//
//  LoanTrackerApp.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import SwiftUI

@main
struct LoanTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
