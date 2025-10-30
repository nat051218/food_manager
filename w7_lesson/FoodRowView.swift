//
//  FoodRowView.swift
//  w7_lesson
//
//  Created by natalee chen on 29/10/2025.
//

import SwiftUI

struct FoodRowView: View {
    let food: Food
    
    private var shouldShowMiniCard: Bool {
        food.type != .pastry
    }
    
    // Type Colors
    private var typeColor: Color {
        switch food.type {
        case .fresh: return .green
        case .cooked: return .orange
        case .pastry: return .pink
        case .dryGoods: return .teal
        }
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(food.foodImage)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black.opacity(0.06))
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(food.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(food.storingPlace)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("titleText"))
                    .lineLimit(2)
                    .minimumScaleFactor(0.9)
                
                // Chips row
                let chips = HStack(spacing: 8) {
                    Text(food.type.rawValue)
                        .font(.caption.weight(.bold))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(typeColor.opacity(0.15))
                        .foregroundColor(typeColor)
                        .cornerRadius(6)
                    
                    ExpirationChip(date: food.expirationDate)
                }
                
                if shouldShowMiniCard {
                    chips
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color(.systemBackground)) // white in light mode
                        )
                        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
                } else {
                    chips
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(uiColor: .systemBackground)) //adapts to light/dark mode
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                )
    }
}
