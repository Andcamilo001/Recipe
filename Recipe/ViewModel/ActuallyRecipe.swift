//
//  RecentRecipe.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import Foundation


class ActuallyRecipe{
    
    var recent:[Recipe] = []
    
    func insertToRecent(x: Recipe){
        if (!self.recent.contains(x)){
            self.recent.insert(x, at: 0)
            print(self.getRecentCount())
        }
        
    }
    
    func deleteFromRecent(index:Int){
        self.recent.remove(at: index)
    }
    
    func clearAll(){
        self.recent = []
    }
    
    func getRecentCount() ->Int{
        return recent.count
    }
}
