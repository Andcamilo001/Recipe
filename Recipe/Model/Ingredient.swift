//
//  Ingredient.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import Foundation

class Ingredient: NSObject, Identifiable{
        
        var id = UUID()
        var imageString: String?
        var ingredientName: String?
        var aisle: String?
        var ingredientImage: Data?
        
        override init(){}
        
        init(iS: String, iN: String, aisle: String){
            self.imageString = iS
            self.ingredientName = iN
            self.aisle = aisle
        }
    }
