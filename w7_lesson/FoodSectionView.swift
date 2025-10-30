//
//  FoodSectionView.swift
//  w7_lesson
//
//  Created by natalee chen on 29/10/2025.
//

import SwiftUI

struct FoodSectionView: View {
    let type: FoodType
    let items: [Food]
    
    var body: some View {
        Section {
            ForEach(items) { item in
                NavigationLink(destination: InfoCard(food: item)) {
                    FoodRowView(food: item)
                }
                .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                .listRowBackground(Color("beige"))
                .listRowSeparator(.hidden)
            }
        } header: {
            HStack {
                Text(type.rawValue)
                    .font(.callout.weight(.semibold))
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 6)
            .padding(.bottom, 2)
        }
    }
}
