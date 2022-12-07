//
//  RecipeList.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 5/12/22.
//

import SwiftUI

struct RecipeList: View {
    
    @State var searchObject: FetchRecipe?
    @State var query:String = ""
    @State var toggleModal = false
    @State private var modalSelection = 1
    @State var clickedRecipe:Recipe = Recipe()
    
    var recents = ActuallyRecipe()
    var ingredients = AddIngredients()
    
    var body: some View {
        NavigationView {
            HStack {
                if(self.recents.getRecentCount() > 0){
                    Text("Recents")
                        .font(.headline)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(self.recents.recent){
                                recipe in
                                Button(action: {
                                    self.toggleModal.toggle()
                                    self.modalSelection = 1
                                    self.clickedRecipe = recipe
                                }){
                                    CellRecipe(recipe: recipe)
                                }
                            }
                        }.listRowInsets(EdgeInsets())
                    }.padding()
                        .listRowInsets(EdgeInsets())
                }
                
                
                
                
                VStack(alignment: .leading){
                    Text("Search")
                        .font(.headline)
                    TextField("Search", text: $query)
                        .cornerRadius(10)
                        .padding()
                   
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                            .shadow(color: Color( "ShadowDark"), radius: 5, x: 10, y: 10)
                                                   .shadow(color: Color.white, radius: 5, x: -10, y: -10)
                    )
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            self.searchObject = FetchRecipe(s: self.query)
                            
                        }){
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                                
                            }
                        }.frame(width: 180, height: 50)
                            .foregroundColor(.white)
                            .font(.headline)
                            .background(Color.blue)
                            .cornerRadius(20)
                       Spacer()
                    }.padding(.vertical)
                    .shadow(color: Color( "ShadowDark"), radius: 5, x: 10, y: 10)
                    .shadow(color: Color.white, radius: 5, x: -10, y: -10)
                    
                    
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        ScrollView(.horizontal, showsIndicators: false ){
                            HStack {
                                ForEach(self.searchObject?.fetchDescription ?? []){
                                    recipe in
                                    Button(action: {
                                        
                                        self.toggleModal.toggle()
                                        self.modalSelection = 1
                                        print("Button Clicked")
                                        self.clickedRecipe = recipe
                                        var _ = ImageIngredient(x: ingredients.ingredientList)
                                        self.recents.insertToRecent(x: self.clickedRecipe)
                                        self.query = ""
                                        self.searchObject?.clearAllLists()
                                        
                                        
                                        
                                    }){
                                        HStack {
                                            Spacer()
                                            CellRecipe(recipe: recipe)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.padding()
            }
        }
        
        .padding(.bottom)
        .sheet(isPresented: $toggleModal) {
            if(self.modalSelection == 1){
                DescriptionView(recipe: self.clickedRecipe, append: AddIngredients())
            }
    }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
