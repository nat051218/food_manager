//
//  ContentView.swift
//  w7_lesson
//
//  Created by natalee chen on 17/10/2025.
//

import SwiftUI

struct ContentView: View {
    private let foods = Food.sampleData
    
    var body: some View {
        ZStack {
            Color("beige").ignoresSafeArea()
            FoodListView(foods: foods)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
