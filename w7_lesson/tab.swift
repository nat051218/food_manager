//
//  tab.swift
//  w7_lesson
//
//  Created by natalee chen on 17/10/2025.
//

import SwiftUI

struct FoodTabView: View {
    var body: some View {
        TabView {
            // Food List
            NavigationStack {
                ContentView()
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color("beige"))
                    .navigationTitle("Nat’s Food Storage")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarBackground(Color("beige"), for: .navigationBar)
                    .toolbarColorScheme(.light, for: .navigationBar)
            }
            .tabItem { Label("List", systemImage: "list.bullet") }
            FoodRecipe()
                .tabItem { Label("Recipe", systemImage: "frying.pan.fill") }
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(Color("beige"), for: .tabBar)
        .tint(.accentColor)
        .background(Color("beige").ignoresSafeArea(.all, edges: .all))
    }
}




#Preview {
    FoodTabView()
}
