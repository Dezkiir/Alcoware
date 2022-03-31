//
//  Repository.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 25/03/2022.
//

import SwiftUI

struct Repository: View {
    
    private var repository = HKRepository()
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: items, spacing: 2) {
                    ForEach(Activity.allActivities()) {activity in
                        NavigationLink(destination: DetailView(activity: activity, repository: repository)) {
                            VStack {
                                Text(activity.image)
                                    .frame(width: 50, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2)))
                                
                                Text(activity.name)
                            }
                            
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2)))
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.padding()
            }
            .navigationTitle("Alcoware Health Stats")
        }.onAppear {
            repository.requestAuthorization { success in
                print("Auth Success? \(success)")
            }
        }
    }
}

struct Repository_Previews: PreviewProvider {
    static var previews: some View {
        Repository()
    }
}
