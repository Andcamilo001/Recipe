//
//  Constants.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import Foundation


struct Constans {
    
    struct urls {
        
        //static let apiKEY = "&apiKey=5da340a8f8b74e7e8c79f37e84db7ec4"
        
        static let apiKEY = "&apiKey=82c5b7acc77342f69584ee04330b5ec8"
        
        static let apiKEY2 = "apiKey=82c5b7acc77342f69584ee04330b5ec8"
        
        static let urlRandom = "https://api.spoonacular.com/recipes/random?number=1&limitLicense=true"
        
        static let complexSearch = "https://api.spoonacular.com/recipes/complexSearch?"
        
        static let infomationBulk = "https://api.spoonacular.com/recipes/informationBulk?"
        
        static let recipesListURL = URL(string: "\(urlRandom)\(apiKEY)")!
        
        static let fetchURL = ("\(complexSearch)\(apiKEY2)&query=")
        
       
        
}
}
