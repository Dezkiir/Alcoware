//
//  AddNewDrink.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 19/02/2022.
//

import SwiftUI

struct AddNewDrink: View {
    
    @State private var drinkType = ""
    //@State var units:Int64
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack(spacing: 15) {
            TextField("New Drink...", text: $drinkType)
//            TextField("Total number of units", int: $units)
        }
        
        Button(action: addDrink) {
            Text("Add Drink")
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity , alignment: .center)
                .cornerRadius(15)
        }.padding(.horizontal)
        .buttonStyle(PlainButtonStyle())
        .disabled(drinkType == "")
    }
    
    private func addDrink() {
        let drink = Drink(context: context)
        drink.drinkType = drinkType
        drink.dateDrank = Date()
//        drink.units = units
        
        do {
            try context.save()
            presentationMode.wrappedValue.dismiss()
        } catch let err {
            print(err.localizedDescription)
            }
    }
    //.navigationTitle("Add New Drink")
}

 

struct AddNewDrink_Previews: PreviewProvider {
    static var previews: some View {
        AddNewDrink()
    }
}
