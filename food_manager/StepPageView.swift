//
//  StepPageView.swift
//  w7_lesson
//
//  Created by natalee chen on 28/10/2025.
//
import SwiftUI

struct StepPageView: View {
    let step: RecipeStep
    let stepIndex: Int
    let totalSteps: Int

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let imageName = step.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(color: Color.black.opacity(0.12), radius: 6, x: 0, y: 3)
                }

                Text("Step \(stepIndex) of \(totalSteps)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(step.title)
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(step.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.systemBackground).opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            }
            .padding()
        }
        .background(
            LinearGradient(colors: [Color("beige").opacity(0.95), Color("beige")],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
    }
}
