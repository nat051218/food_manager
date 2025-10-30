//
//  ExpirationChip.swift
//  w7_lesson
//
//  Created by natalee chen on 29/10/2025.
//

import SwiftUI

struct ExpirationChip: View {
    let date: Date
    
    private var daysRemaining: Int {
        let start = Calendar.current.startOfDay(for: Date())
        let end = Calendar.current.startOfDay(for: date)
        return Calendar.current.dateComponents([.day], from: start, to: end).day ?? 0
    }
    
    private var chipText: String {
        if daysRemaining < 0 { return "Expired" }
        if daysRemaining == 0 { return "Expires Today" }
        if daysRemaining == 1 { return "1 day left" }
        return "\(daysRemaining) days left"
    }
    
    private var chipColor: Color {
        if daysRemaining < 0 { return .red.opacity(0.20) }
        if daysRemaining <= 1 { return .orange.opacity(0.22) }
        return .green.opacity(0.20)
    }
    
    private var textColor: Color {
        if daysRemaining < 0 { return .red }
        if daysRemaining <= 1 { return .orange }
        return .green
    }
    
    var body: some View {
        Text(chipText)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(chipColor)
            .foregroundColor(textColor)
            .clipShape(Capsule())
    }
}
