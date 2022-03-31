//
//  HKRepository.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 24/03/2022.
//

import Foundation
import HealthKit

final class HKRepository {
    var store: HKHealthStore?
    
    let allTypes = Set([
        HKObjectType.quantityType(forIdentifier: .bloodAlcoholContent)!,
        HKObjectType.quantityType(forIdentifier: .numberOfAlcoholicBeverages)!,
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
        HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
        HKObjectType.quantityType(forIdentifier: .respiratoryRate)!
    ])
    
    // Querying the HealthKit Collection
    var query: HKStatisticsCollectionQuery?
    
    init() {
        store = HKHealthStore()
    }
    
    //Requesting Authorization for Health Stats
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        // Guard to make sure store is initialised
        guard let store = store else {
            return
        }
        
        // Reading objects from HealthKit
        store.requestAuthorization(toShare: [], read: allTypes) { success, error in
            completion(success)
        }
    }
    
    func requestHealthStat(by category: String, completion: @escaping ([HealthStat]) -> Void) {
        // Guard to make sure store is initialised
        guard let store = store, let type = HKObjectType.quantityType(forIdentifier: typeByCategory(category: category)) else {
            return
        }
        
        // Query to predicate the data from HealthKit
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
        let endDate = Date()
        let anchorDate = Date.firstDayOfWeek()
        let dailyComponent = DateComponents(day: 1)
        
        var healthStats = [HealthStat]()
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: predicate, options: HKStatisticsOptions.mostRecent, anchorDate: anchorDate, intervalComponents: dailyComponent)
        
        query?.initialResultsHandler = { query, statistics, error in
            statistics?.enumerateStatistics(from: startDate, to: endDate, with: { stats, _  in
                let stat = HealthStat(stat: stats.sumQuantity(), date: stats.startDate)
                healthStats.append(stat)
            })
            
            completion(healthStats)
        }
        
        guard let query = query else {
            return
        }
        
        store.execute(query)
    }
    
    private func typeByCategory(category: String) -> HKQuantityTypeIdentifier {
        switch category {
        case "bloodAlcoholContent":
            return .bloodAlcoholContent
        case "numberOfAlcoholicBeverages":
            return .numberOfAlcoholicBeverages
        case "heartRate":
            return .heartRate
        case "heartRateVariabilitySDNN":
            return .heartRateVariabilitySDNN
        case "oxygenSaturation":
            return .oxygenSaturation
        case "respiratoryRate":
            return .respiratoryRate
        default:
            return .respiratoryRate
        }
    }
}
