//
//  DrinkInput.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 16/02/2022.
//

import SwiftUI

struct DrinkInput: View {
    
    @FetchRequest(
        entity: Drink.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Drink.dateDrank, ascending: false)],
        animation: .easeOut
    )
    
    var results: FetchedResults<Drink>
    
    
    var body: some View {
        List {
            ForEach(results) { item in
                HStack {
                    NavigationLink(
                        destination: Text(item.drinkType ?? ""),
                        label: {
                            Text(item.drinkType ?? "")
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .contentShape(Rectangle())
                        //.background(LinearGradient(gradient: Gradient(colors: [Color.Color]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(5)
                }
            }
            
            //Button to go to Submenu for adding Drink
            NavigationLink(
                destination: AddNewDrink(),
                label: {
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                        Text("New Drink")
                        Spacer()
                    }
                })
        // Syling for Zoom Out when scrolling feature
        }.listStyle(CarouselListStyle())
            .navigationTitle("Drink Input")
    }
}

struct DrinkInput_Previews: PreviewProvider {
    static var previews: some View {
        DrinkInput()
    }
}
