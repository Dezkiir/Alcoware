//
//  PeristentController.swift
//  Alcoware WatchKit Extension
//  Database Handler to Input Drink Objects
//
//  Created by Dylan Deakin on 16/02/2022.
//

import Foundation
import CoreData

struct PersistentController {
    
    static let shared = PersistentController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DrinkInput")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { (storeDesc, error) in
            if let error = error as NSError? {
                fatalError("Failed to Load Container \(error)")
            }
        }
    }
}
    
