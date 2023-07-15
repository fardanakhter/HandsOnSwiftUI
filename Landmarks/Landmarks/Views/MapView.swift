//
//  MapView.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    let coordinates: CLLocationCoordinate2D
    
     @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
     )
    
    var body: some View {    
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinates)
            }
    }
    
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
