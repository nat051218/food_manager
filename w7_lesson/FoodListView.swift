//
//  FoodListView.swift
//  w7_lesson
//
//  Created by natalee chen on 29/10/2025.
//

import SwiftUI

struct FoodListView: View {
    let foods: [Food]
    
    var body: some View {
        List {
            ForEach(FoodType.allCases, id: \.self) { type in
                let items = foods.filter { $0.type == type }
                if !items.isEmpty {
                    FoodSectionView(type: type, items: items)
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .listSectionSpacing(.custom(8))
    }
}
