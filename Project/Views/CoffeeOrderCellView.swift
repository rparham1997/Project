//
//  CoffeeOrderCellView.swift
//  Project
//
//  Created by Ramar Parham on 5/6/24.
//

import SwiftUI

struct CoffeeOrderCellView: View {
    
    let order: CoffeeOrder
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.coffeeName)
                Text(order.name)
                    .font(.caption)
                    .opacity(0.8)
            }
            Spacer()
            Text(order.size.rawValue)
                .padding(10)
                .foregroundColor(.white)
                .background {
                    Color.orange
                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        }
    }
}
