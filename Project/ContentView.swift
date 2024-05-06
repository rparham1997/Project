//
//  ContentView.swift
//  Project
//
//  Created by Ramar Parham on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Property Wrappers
    
    @EnvironmentObject var webservice: Webservice
    @State private var isPresented: Bool = false
    
    // MARK: - UI related code
    var body: some View {
        NavigationView {
            List(webservice.coffeeOrders) { order in
                CoffeeOrderCellView(order: order)
            }.task {
                try? await webservice.populateCoffeeOrders()
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Order") {
                        isPresented = true
                    }
                }
            }.sheet(isPresented: $isPresented) {
                AddCoffeeOrderView()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(Webservice())
}
