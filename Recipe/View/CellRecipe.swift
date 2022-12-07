//
//  CellRecipe.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 6/12/22.
//

import SwiftUI

struct CellRecipe: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Image(uiImage: ((UIImage(data: self.recipe.recipeImage ?? Data())) ?? UIImage(systemName: "ipodtouch.slash"))!)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(color: Color( "ShadowDark"), radius: 15, x: 10, y: 10)
                .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                .padding(.bottom, 5)
            
            Text(self.recipe.title ?? "Title Not Found")
                .foregroundColor(.black)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
            
        }.padding(.vertical)
            .padding(.horizontal,10)
            .frame(width: 250)
            
    }
}

/*struct CellRecipe_Previews: PreviewProvider {
    static var previews: some View {
        CellRecipe(recipe: Recipe.)
    }
}*/
