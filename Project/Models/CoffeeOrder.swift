//
//  CoffeeOrder.swift
//  Project
//
//  Created by Ramar Parham on 5/6/24.
//

import Foundation

enum CoffeeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct CoffeeOrder: Codable, Identifiable {

    let name: String
    let coffeeName: String
    let total: Double
    let size: CoffeeSize

    var id: UUID { return UUID() }
}
