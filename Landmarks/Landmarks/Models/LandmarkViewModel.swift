//
//  LandmarkViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import Foundation
import CoreLocation

struct LandmarkViewModel: Identifiable {
    let id = UUID()
    private let landmark: Landmark
    
    init(_ landmark: Landmark) {
        self.landmark = landmark
    }
    
    var landmarkImage: String {
        landmark.imageName
    }
    
    var landmarkName: String {
        landmark.name
    }
    
    var landmarkPark: String {
        landmark.park
    }
    
    var landmarkState: String {
        landmark.state
    }
    
    var landmarkDescription: String {
        landmark.description
    }
    
    var coordinates: CLLocationCoordinate2D {
        .init(latitude: landmark.coordinates.latitude, longitude: landmark.coordinates.longitude)
    }
}
