//
//  IntroStepView.swift
//  w7_lesson
//
//  Created by natalee chen on 28/10/2025.
//
import SwiftUI

struct IntroStepView: View {
    let recipe: RecipeItem

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Hero image
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 700)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .shadow(color: Color.black.opacity(0.12), radius: 6, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .strokeBorder(Color.black.opacity(0.05))
                    )
                    .padding(.horizontal)

                .padding(16)
                .background(
                    LinearGradient(
                        colors: [Color.orange.opacity(0.08), Color.orange.opacity(0.03)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.orange.opacity(0.15), lineWidth: 0.5)
                )
                .frame(maxWidth: 700)
                .padding(.horizontal)

                // Ingredients card
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.orange)
                        Text("Ingredients")
                            .font(.headline)
                            .foregroundColor(.orange)
                        Spacer()
                    }

                    Divider().overlay(Color.black.opacity(0.06))

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(recipe.ingredients.enumerated()), id: \.offset) { index, item in
                            HStack(alignment: .top, spacing: 10) {
                                ZStack {
                                    Circle()
                                        .fill(Color.orange.opacity(0.15))
                                        .frame(width: 22, height: 22)
                                    Text("\(index + 1)")
                                        .font(.caption2.weight(.semibold))
                                        .foregroundColor(.orange)
                                }
                                Text(item)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color.black.opacity(0.06), lineWidth: 0.5)
                )
                .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
                .frame(maxWidth: 700)
                .padding(.horizontal)
            }
            .padding(.vertical, 16)
        }
        .background(
            LinearGradient(
                colors: [
                    Color("beige").opacity(0.98),
                    Color("beige")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}
