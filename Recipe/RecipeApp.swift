//
//  RecipeApp.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import SwiftUI

@main
struct RecipeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
