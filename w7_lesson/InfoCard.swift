//
//  InfoCard.swift
//  w7_lesson
//
//  Created by natalee chen on 17/10/2025.
//

import SwiftUI

struct InfoCard: View {
    
    let food: Food
    
    private var daysRemaining: Int {
        let start = Calendar.current.startOfDay(for: Date())
        let end = Calendar.current.startOfDay(for: food.expirationDate)
        return Calendar.current.dateComponents([.day], from: start, to: end).day ?? 0
    }
    
    private var statusText: String {
        if daysRemaining < 0 { return "Expired" }
        if daysRemaining == 0 { return "Expires Today" }
        if daysRemaining == 1 { return "1 day left" }
        return "\(daysRemaining) days left"
    }
    
    private var statusColor: (bg: Color, fg: Color) {
        if daysRemaining < 0 { return (.red.opacity(0.18), .red) }
        if daysRemaining <= 1 { return (.orange.opacity(0.20), .orange) }
        return (.green.opacity(0.18), .green)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color("beige").opacity(0.95),  Color("beige")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 22) {
                    // Header
                    VStack(spacing: 6) {
                        Text(food.name)
                            .font(.largeTitle.bold())
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        Text(food.type.rawValue)
                            .font(.subheadline.weight(.semibold))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue.opacity(0.12))
                            .foregroundColor(.blue)
                            .clipShape(Capsule())
                    }
                    .padding(.top)
                    
                    // Hero image
                    Image(food.foodImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 420)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .shadow(color: Color.black.opacity(0.12), radius: 10, x: 0, y: 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .strokeBorder(Color.black.opacity(0.05))
                        )
                        .padding(.horizontal)
                    
                    // Details info card
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Label("Expiration", systemImage: "calendar")
                                .font(.headline)
                                .labelStyle(.titleAndIcon)
                            Spacer()
                            Text(food.expirationDate, style: .date)
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                        }
                        
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Label("Storage", systemImage: "shippingbox.fill")
                                .font(.headline)
                                .labelStyle(.titleAndIcon)
                            Spacer()
                            Text(food.storingPlace)
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        // Status chip
                        HStack {
                            Label(statusText, systemImage: daysRemaining < 0 ? "exclamationmark.triangle.fill" : "clock.fill")
                                .font(.subheadline.weight(.semibold))
                                .foregroundColor(statusColor.fg)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(statusColor.bg)
                                .clipShape(Capsule())
                            Spacer()
                        }
                        .padding(.top, 4)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color(.systemBackground))
                    )
                    .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    if food.type == .fresh {
                        NavigationLink {
                            FoodRecipe()
                        } label: {
                            Text("See Recipes")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    LinearGradient(colors: [Color.accentColor.opacity(0.9), Color.accentColor],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: Color.accentColor.opacity(0.25), radius: 8, x: 0, y: 4)
                                .padding(.horizontal)
                        }
                        .padding(.top, 4)
                    }
                }
                .padding(.bottom, 24)
            }
            .navigationTitle("Info Card")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}





#Preview {
    NavigationStack {
        InfoCard(
            food: Food(
                name: "Croissant",
                type: .pastry,
                expirationDate: Calendar.current.date(from: DateComponents(year: 2025, month: 10, day: 20)) ?? Date(),
                storingPlace: "Pantry",
                foodImage: "croissant"
            )
        )
    }
}
