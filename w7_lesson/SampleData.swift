//
//  SampleData.swift
//  w7_lesson
//
//  Created by natalee chen on 29/10/2025.
//

import Foundation

extension Food {
    static let sampleData: [Food] = [
        Food(name: "Croissant", type: .pastry,
             expirationDate: Calendar.current.date(from: .init(year: 2025, month: 11, day: 20))!,
             storingPlace: "Pantry", foodImage: "croissant"),
        
        Food(name: "Watermelon", type: .fresh,
             expirationDate: Calendar.current.date(from: .init(year: 2025, month: 11, day: 18))!,
             storingPlace: "Fridge - Crisper Drawer", foodImage: "watermelon"),
        
        Food(name: "Animal Cracker", type: .dryGoods,
             expirationDate: Calendar.current.date(from: .init(year: 2025, month: 12, day: 7))!,
             storingPlace: "Snack Box", foodImage: "animalCracker"),
        
        Food(name: "Mango", type: .fresh,
             expirationDate: Calendar.current.date(from: .init(year: 2025, month: 11, day: 13))!,
             storingPlace: "Fridge - Crisp Drawer", foodImage: "mango"),
        
        Food(name: "Lemon Tart", type: .pastry,
             expirationDate: Calendar.current.date(from: .init(year: 2025, month: 10, day: 27))!,
             storingPlace: "Fridge - Second Shelf", foodImage: "lemonTart"),
        
        Food(name: "Bento", type: .cooked,
             expirationDate: Calendar.current.date(from: .init(year: 2025, month: 11, day: 14))!,
             storingPlace: "Fridge - Bottom Shelf", foodImage: "bento")
    ]
}
