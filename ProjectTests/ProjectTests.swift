//
//  ProjectTests.swift
//  ProjectTests
//
//  Created by Ramar Parham on 5/6/24.
//

import XCTest
@testable import Project

final class ProjectTests: XCTestCase {

    func testCoffeeOrderInitialization() {
            let order = CoffeeOrder(name: "John Doe", coffeeName: "Latte", total: 3.50, size: .medium)
            
            XCTAssertEqual(order.name, "John Doe")
            XCTAssertEqual(order.coffeeName, "Latte")
            XCTAssertEqual(order.total, 3.50)
            XCTAssertEqual(order.size, .medium)
        }
        
        func testCoffeeOrderID() {
            let order1 = CoffeeOrder(name: "Jane Smith", coffeeName: "Espresso", total: 2.00, size: .small)
            let order2 = CoffeeOrder(name: "John Doe", coffeeName: "Latte", total: 3.50, size: .medium)
            
            XCTAssertNotEqual(order1.id, order2.id)
        }

        static var allTests = [
            ("testCoffeeOrderInitialization", testCoffeeOrderInitialization),
            ("testCoffeeOrderID", testCoffeeOrderID)
        ]
    
}
