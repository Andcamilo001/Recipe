//
//  FeaturedRecipeViewModel.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import Foundation

class RandomRecipe {
    
    var featured = Recipe()
    var fail = false
    var append = AddIngredients()
    
    init(){
        
        self.fail = false
        self.getRandomRecipe()
        
    }
    
    
    let request = NSMutableURLRequest(url: Constans.urls.recipesListURL) /*as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)*/
    
    
    func getRandomRecipe() {
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        var semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print("Error Request Timed Out")
                self.fail = true
            } else {
                var err: NSError?
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                if (err != nil) {
                    print("JSON Error \(err!.localizedDescription)")
                    self.fail = true
                }
                
                if("\(jsonResult["status"] ?? "")" == "failure"){
                    print("Fail")
                    self.fail = true
                }
                
                if (!self.fail){
                
                let results = jsonResult["recipes"] as! NSArray
                
                
                
                let result = results[0] as! [String:AnyObject]
                
                             
                
                self.featured.servings = "\(result["servings"]!)"
                self.featured.instructions = result["instructions"] as? String
                
                self.featured.title = result["title"] as? String
                self.featured.sourceName = result["sourceName"] as? String
                self.featured.readyIn = "\(result["readyInMinutes"]!)"
                self.featured.likeCount = "\(result["aggregateLikes"]!)"
                
                self.featured.imageUrl = result["image"] as? String
                
                print("\(result["vegan"]!)")
                print("\(result["vegetarian"]!)")
                
                if("\(result["vegetarian"]!)" == "0"){
                    self.featured.vegetarian = false
                }else{
                    self.featured.vegetarian = true
                }
                
                if("\(result["vegan"]!)" == "0"){
                    self.featured.vegan = false
                }else{
                    self.featured.vegan = true
                }
                
                let imageUrl = "https://spoonacular.com/cdn/ingredients_100x100/"
                
                for i in (result["extendedIngredients"] as! [Any]){
                    let ingredientInfo = i as! [String:AnyObject]
                    let ingredient = Ingredient(iS: imageUrl + (ingredientInfo["image"] as? String ?? "not_found"), iN: ingredientInfo["originalString"] as? String ?? "Not Found", aisle: ingredientInfo["aisle"] as? String ?? "Not Found")
                        self.append.appendIngredient(i: ingredient)
                    
                }
                
                print("Finished Loading Data")
            }
            }
            semaphore.signal()
            
        })
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        
        if(!self.fail){
        
            semaphore = DispatchSemaphore(value: 0)
            print("Attempting to get featured image")
            
            let url = (URL(string: self.featured.imageUrl ?? "") ?? URL(string: ""))!
            
            print(self.featured.imageUrl!)
            
            let imageRequest = session.dataTask(with: url, completionHandler: { data, response, error -> Void in
                if (error != nil) {
                    print(error!.localizedDescription)
                }
                
                var err: NSError?
                self.featured.recipeImage = data!
                semaphore.signal()
                
            })
            imageRequest.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        }
        
    }
    
}
