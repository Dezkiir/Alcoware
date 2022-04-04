//
//  Home.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 29/03/2022.
//

import SwiftUI

struct Home: View {
    // HealthKit data to dynamically adjust levels goes here
    let values = [3, 11, 3, 12, 8, 10, 9]
    let labels = ["3", "11", "3", "12", "8", "10", "9"]
    let xAxisLabels = ["M", "T", "W", "T", "F", "S", "S"]
    
    var body: some View {
        ScrollView {
            DrinkChart(values: values, labels: labels, xAxisLabels: xAxisLabels).scaledToFit()
            VStack {
                //Navigate to Drink Input
                NavigationLink(destination: DrinkInput()) {
                    Text("Drink Input")
                }
                //Navigate to Repository
                NavigationLink(destination: Repository()) {
                    Text("Repository")
                }
                //Navigate to Taxi
                NavigationLink(destination: Taxi()) {
                    Text("Taxi")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
