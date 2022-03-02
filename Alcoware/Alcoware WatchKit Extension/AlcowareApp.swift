//
//  AlcowareApp.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 16/02/2022.
//

import SwiftUI

@main
struct AlcowareApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environment(\.managedObjectContext, PersistentController.shared.container.viewContext)
        }
    }
}
