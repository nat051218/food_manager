//
//  food.swift
//  w7_lesson
//
//  Created by natalee chen on 17/10/2025.
//

import Foundation

enum FoodType: String, CaseIterable, Codable, Sendable {
    case fresh = "Fresh"
    case cooked = "Cooked"
    case pastry = "Pastry"
    case dryGoods = "Dry Goods"
}

struct Food: Identifiable, Codable, Sendable {
    let id = UUID()
    let name: String
    let type: FoodType
    let expirationDate: Date
    let storingPlace: String
    let foodImage: String
}
