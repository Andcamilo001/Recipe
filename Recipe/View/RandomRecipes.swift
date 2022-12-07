//
//  RandomRecipes.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 6/12/22.
//

import SwiftUI

struct RandomRecipes: View {
    
    var random = RandomRecipe()
    
    var body: some View {
        
        ZStack{
            VStack{
                Text("\(self.random.featured.title ?? "Title Not Found")")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.bottom,20)
                    .padding()
                HStack {
                    Spacer()
                    Image(uiImage: ((UIImage(data: self.random.featured.recipeImage ?? Data())) ?? UIImage(systemName: "ipodtouch.slash"))!)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .shadow(color: Color( "ShadowDark"), radius: 5, x: 10, y: 10)
                        .shadow(color: Color.white, radius: 5, x: -10, y: -10)
                    
                    
                    Spacer()
                }
                    
            }
            .padding(.horizontal, 25)
            
        }
    }
}

struct RandomRecipes_Previews: PreviewProvider {
    static var previews: some View {
        RandomRecipes()
    }
}
