//
//  IngredientImage.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import Foundation


class ImageIngredient {
    
    var ingredientList:[Ingredient]?
    
    let imageUrl = "https://spoonacular.com/cdn/ingredients_100x100/"
    
    init(x:[Ingredient]){
        self.ingredientList = x
        fetchImages()
    }
    
    
    func fetchImages(){
        for i in ingredientList ?? []{
            print(i.imageString ?? "")
            let semaphore = DispatchSemaphore(value: 0)
            print("Attempting to get featured image")
            
            let url = (URL(string: i.imageString ??  "") ?? URL(string: ""))!
            
            
            
            let imageRequest = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error -> Void in
                if (error != nil) {
                    print(error!.localizedDescription)
                }
                
                var err: NSError?
                i.ingredientImage = data!
                semaphore.signal()
                
            })
            imageRequest.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        }
        
    }
}
