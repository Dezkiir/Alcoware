//
//  Date+Extension.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 25/03/2022.
//

import Foundation

extension Date {
    static func firstDayOfWeek() -> Date {
        // ISO Calendar recognizes Monday as the first day of the week
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))! ?? Date()
    }
}
