//
//  Home.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 29/03/2022.
//

import SwiftUI

struct Home: View {
    
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
