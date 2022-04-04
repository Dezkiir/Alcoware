//
//  Taxi.swift
//  Alcoware WatchKit Extension
//
//  Created by Dylan Deakin on 31/03/2022.
//

import SwiftUI
import MapKit
import UIKit
import CoreLocation
import Combine

struct Taxi: View {
    
    @StateObject var deviceLocationService = DeviceLocationService.shared

    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.3498, longitude: 6.2603), latitudinalMeters: 0.2, longitudinalMeters: 0.2)
    var body: some View {
        ScrollView {
                Map(coordinateRegion: $mapRegion, showsUserLocation: true).frame(width: 160, height: 80)
                VStack {
                    Text("Latitude: \(coordinates.lat)")
                    Text("Longitude: \(coordinates.lon)")
                }
                
                HStack {
                    Link("Fetch Taxi", destination: URL(string: "https://www.apple.com")!)
                }
            }
        }
    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
            }
            .store(in: &tokens)
    }

    func observeDeniedLocationAccess() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("Handle access denied event, possibly with an alert.")
            }
            .store(in: &tokens)
    }
}

struct Taxi_Previews: PreviewProvider {
    static var previews: some View {
        Taxi()
    }
}
