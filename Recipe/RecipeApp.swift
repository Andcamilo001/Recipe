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
    
    init () {
        
        setupTheme()
        
        
    }
    
    
    
    private func setupTheme() {
        
        let headerAppearance = UINavigationBarAppearance()
        
        
        
        headerAppearance.backgroundColor = UIColor(#colorLiteral(red: 32/255, green: 21/255, blue: 54/255, alpha: 1.0))
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        headerAppearance.titleTextAttributes = textAttributes
        headerAppearance.largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = .white
        
        UINavigationBar.appearance().scrollEdgeAppearance = headerAppearance
        
        
        
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
            //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
