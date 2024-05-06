//
//  ProjectApp.swift
//  Project
//
//  Created by Ramar Parham on 5/6/24.
//

import SwiftUI

@main
struct ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView().environmentObject(Webservice())
            }
        }
    }
}
