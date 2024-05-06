//
//  Webservice.swift
//  Project
//
//  Created by Ramar Parham on 5/6/24.
//

import Foundation


// MARK: - Service Class
class Webservice: ObservableObject {
    
    @Published var coffeeOrders: [CoffeeOrder] = []
    
    func placeOrder(coffeeOrders: CoffeeOrder) async throws {
        var request = URLRequest(url: URL(string: "https://island-bramble.glitch.me/orders")!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(coffeeOrders)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try! await URLSession.shared.data(for: request)
        let savedOrderResponse = try JSONDecoder().decode(SavedOrderResponse.self, from: data)
        
        if savedOrderResponse.sucess {
            try await populateCoffeeOrders()
        }
    }
    
    func populateCoffeeOrders() async throws {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://island-bramble.glitch.me/orders")!)
        
        Task { @MainActor in
            self.coffeeOrders = try JSONDecoder().decode([CoffeeOrder].self, from: data)
        }
    }
}
