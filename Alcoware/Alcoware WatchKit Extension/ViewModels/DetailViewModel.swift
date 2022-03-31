//
//  DetailViewModel.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 28/03/2022.
//

import Foundation
import HealthKit

final class DetailViewModel: ObservableObject {
    var activity: Activity
    var repository: HKRepository
    
    @Published var stats = [HealthStat]()
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    init (activity: Activity, repository: HKRepository) {
        self.activity = activity
        self.repository = repository
        repository.requestHealthStat(by: activity.id) { hStats in
            self.stats = hStats
        }
    }
    
    let measurementFormatter = MeasurementFormatter()
    
    func value(from stat: HKQuantity?) -> (value: Int, desc: String) {
        guard let stat = stat else { return (0, "")}
        
        measurementFormatter.unitStyle = .long
        // Blood Oxygen
        if stat.is(compatibleWith: .percent()) {
            let value = stat.doubleValue(for: .percent())
            return (Int(value), stat.description)
        // Blood Alcohol Concentrate
        } else if stat.is(compatibleWith: .percent()) {
            let value = stat.doubleValue(for: .percent())
            return (Int(value), stat.description)
        // Heart Rate Variability
        } else if stat.is(compatibleWith: .secondUnit(with: .milli)) {
            let value = stat.doubleValue(for: .secondUnit(with: .milli))
            return (Int(value), stat.description)
        // Alcohol Consumed
        } else if stat.is(compatibleWith: .pintUS()) {
            let value = stat.doubleValue(for: .pintUS())
            return (Int(value), stat.description)
        // Breaths per Minute
        } else if stat.is(compatibleWith: .minute()) {
            let value = stat.doubleValue(for: .minute())
            return (Int(value), stat.description)
        
        } else if stat.is(compatibleWith: .minute()) {
            let value = stat.doubleValue(for: .minute())
            return (Int(value), stat.description)
        }
        return (0, "")
    }
}
