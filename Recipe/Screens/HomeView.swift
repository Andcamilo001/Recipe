//
//  HomeView.swift
//  Recipe
//
//  Created by Andres Camilo Lezcano on 6/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            TabView{
                Text("Welcome to Recipes\n by\n EmpowermentLab")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 32/255, green: 21/255, blue: 54/255))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .shadow(color: .gray, radius: 3, x: 0.0, y: 0.0)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                RecipeList()
                    .tabItem{
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Seacrh")
                    }
                RandomRecipes()
                    .tabItem{
                        Image(systemName: "fork.knife.circle.fill")
                        Text("Random")
                    }
                Text("Favoritos")
                    .tabItem{
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }
            }
            .navigationTitle("Recipes EmpLab")
            .accentColor(Color(red: 32/255, green: 21/255, blue: 54/255))
            
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
