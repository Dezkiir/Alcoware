//
//  Drink Chart.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 21/03/2022.
//

import SwiftUI
import HealthKit


struct DrinkChart: View {
    
    let values: [Int]
    let labels: [String]
    let xAxisLabels: [String]
    var type = ["Hourly", "Daily", "Weekly"]
        
    var body: some View {
        GeometryReader { geo in
            
            HStack(alignment: .bottom) {
                ForEach(0..<values.count) { idx in
                    let max = values.max() ?? 0
                    
                    VStack {
                        Text(labels[idx])
                            .font(.caption)
                            .rotationEffect(.degrees(-60))
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .frame(width: 20, height: CGFloat(values[idx]) / CGFloat(max) * geo.size.height * 0.6)
                        
                        Text(xAxisLabels[idx])
                            .font(.caption)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(10)
            .padding(.bottom, 20)
        }
    }
}

    struct Drink_Chart_Previews: PreviewProvider {
        static var previews: some View {
            // HealthKit data to dynamically adjust levels goes here
            let values = [213, 211, 443, 3, 3, 342, 22]
            let labels = ["213", "211", "443", "3", "3", "342", "22"]
            let xAxisLabels = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            DrinkChart(values: values, labels: labels, xAxisLabels: xAxisLabels)
        }
    }

