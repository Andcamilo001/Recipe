//
//  Recipe.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import Foundation


struct Recipe: Identifiable, Equatable {
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        if(lhs.title == rhs.title){
            if(lhs.sourceName == rhs.sourceName){
                if(lhs.imageUrl == rhs.imageUrl){
                    return true
                }
            }else{
                return false
            }
        }else{
            return false
        }
        
        return false
    }
    
        
    var id = UUID()
    var servings: String?
    var readyIn: String?
    var likeCount: String?
    
    
    var title: String?
    var imageUrl: String?
    var recipeImage: Data?
    var sourceName: String?
    var instructions: String?
    
    var vegetarian:Bool?
    var vegan: Bool?
    
    
    init(){}
    
    init(servings: String, readyIn: String, likeCount: String, title: String, imageUrl: String, sourceName: String, instructions: String, vegetarian: Bool, vegan: Bool){
        self.servings = servings
        self.readyIn = readyIn
        self.likeCount = likeCount
        
        self.title = title
        self.imageUrl = imageUrl
        self.sourceName = sourceName
        self.instructions = instructions
        
        self.vegetarian = vegetarian
        self.vegan = vegan
    }
}

