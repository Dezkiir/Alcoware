//
//  AlcowareApp.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 29/03/2022.
//

import SwiftUI

@main
struct AlcowareApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
