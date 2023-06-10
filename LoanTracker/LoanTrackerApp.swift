//
//  LoanTrackerApp.swift
//  LoanTracker
//
//  Created by MacBook Pro on 10/06/2023.
//

import SwiftUI

@main
struct LoanTrackerApp: App {

    var body: some Scene {
        WindowGroup {
            AllLoansView()
                .environment(\.managedObjectContext,PersistenceController.shared.container.viewContext)
        }
    }
}
