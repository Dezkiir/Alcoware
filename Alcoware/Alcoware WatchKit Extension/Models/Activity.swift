//
//  Activity.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 24/03/2022.
//

import Foundation

struct Activity: Identifiable {
    var id: String
    var name: String
    var image: String
    
    static func allActivities() -> [Activity] {
        return[
            Activity(id:"bloodAlcoholContent", name:"BAC", image: "π©Έπ·"),
            Activity(id:"heartRate", name:"BPM", image: "β€οΈ "),
            Activity(id:"heartRateVariabilitySDNN", name:"HRV", image: "π"),
            Activity(id:"oxygenSaturation", name:"BO2", image: "π©Έ"),
            Activity(id:"respiratoryRate", name:"BrPM", image: "π«"),
            Activity(id:"numberOfAlcoholicBeverages", name:"Units", image: "π·")
            ]
    }
}
