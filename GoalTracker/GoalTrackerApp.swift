//
//  GoalTrackerApp.swift
//  GoalTracker
//
//  Created by Josh Marcelin on 2/4/23.
//

import SwiftUI

@main
struct GoalTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
