//
//  DescriptionView.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 6/12/22.
//

import SwiftUI

struct DescriptionView: View {
    
    var recipe: Recipe
    
    var append: AddIngredients
    
    var body: some View {
        
        List(){
                        
            VStack(alignment: .leading){
                
                Text(recipe.title ?? "Error Getting Information")
                    .font(.title)
                
                Text("by \(recipe.sourceName ?? "N/A")")
                    .fontWeight(.light)
                
                HStack{
                    
                    Image(uiImage: ((UIImage(data: self.recipe.recipeImage ?? Data())) ?? UIImage(systemName: "ipodtouch.slash"))!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .shadow(color: Color( "ShadowDark"), radius: 5, x: 10, y: 10)
                        .shadow(color: Color.white, radius: 5, x: -10, y: -10)
                        .foregroundColor(.white)
                        .listRowInsets(EdgeInsets())
                    
                }.padding(.vertical)
                
            }.padding()
                .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                    .padding(.leading)
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(append.ingredientList){
                            i in
                            IngredientCell(ingredient: i)
                        }
                    }.padding(.top, 5)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
               /* HStack {
                    Spacer()
                    QuickInfoCard(servings: self.recipe.servings ?? "Not Found", readyIn: self.R.readyIn ?? "Not Found" , likeCount: self.R.likeCount ?? "Not Found")
                        .shadow(color: Color( "ShadowDark"), radius: 15, x: 10, y: 10)
                        .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                    Spacer()
                }.padding(.top)*/
            }
            .padding(.top)
            .padding(.bottom, 50)
            .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading, spacing: 3.0){
                Text("Instructions")
                    .font(.headline)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.white)
                    .cornerRadius(10)
                        .padding()
                    
                    
                    
                    Text(recipe.instructions ?? "Sorry No Instructions were found")
                        .lineSpacing(1.7)
                        .font(.footnote)
                        .padding()
                    .padding()
                }
                .shadow(color: Color( "ShadowDark"), radius: 15, x: 10, y: 10)
                .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                
            }.listRowInsets(EdgeInsets())
                .padding(.horizontal)
                .padding(.bottom)
            
            
        }
        .listRowInsets(EdgeInsets())
        .navigationBarHidden(true)
            
            
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        
    }
    
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(recipe: Recipe(), append: AddIngredients())
    }
}
