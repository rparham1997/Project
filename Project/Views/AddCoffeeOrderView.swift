//
//  AddCoffeeOrderView.swift
//  Project
//
//  Created by Ramar Parham on 5/6/24.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @EnvironmentObject private var webservice: Webservice
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var total: String = ""
    @State private var selectedCoffee: CoffeeSize = .medium
    
    @Environment(\.dismiss) var dismiss 
    
    var isValid: Bool {
        return !name.isEmpty && !coffeeName.isEmpty && !total.isEmpty
    }
    
    private func placeOrder() {
        let order = CoffeeOrder(name: name, coffeeName: coffeeName, total: Double(total) ?? 0.0, size: selectedCoffee)
        Task {
            try? await webservice.placeOrder(coffeeOrders: order)
            dismiss()
        }
    }

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Coffee name", text: $coffeeName)
            Picker("Coffee Size", selection: $selectedCoffee) {
                ForEach(CoffeeSize.allCases, id: \.self) { coffeeSize in
                    Text(coffeeSize.rawValue).tag(selectedCoffee.rawValue)
                }
            }.pickerStyle(.segmented)
            
            TextField("Total", text: $total)
            
            Button {
                if isValid {
                    placeOrder()
                } else {
                    
                }
            } label: {
                Text("Place Order")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    AddCoffeeOrderView()
}
