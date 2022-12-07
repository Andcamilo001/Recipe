//
//  ingredientCell.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 6/12/22.
//

import SwiftUI

struct IngredientCell: View {
    
    var ingredient: Ingredient
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: 230)
                .cornerRadius(20)
                .shadow(color: Color( "ShadowDark"), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white, radius: 10, x: -10, y: -10)
                .padding()
            
            VStack(alignment: .center){
                Image(uiImage: ((UIImage(data: self.ingredient.ingredientImage ?? Data())) ?? UIImage(systemName: "ipodtouch.slash"))!)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 135, height: 135)
                    .cornerRadius(20)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                
                Text(self.ingredient.ingredientName ?? "Name Not Found")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)

                
                
            }.frame(width: 175)
            
            
            
        }
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(ingredient: Ingredient())
    }
}

