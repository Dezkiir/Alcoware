//
//  HealthStat.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 24/03/2022.
//

import Foundation
import HealthKit


struct HealthStat : Identifiable {
    let id = UUID()
    let stat: HKQuantity?
    let date: Date
}
