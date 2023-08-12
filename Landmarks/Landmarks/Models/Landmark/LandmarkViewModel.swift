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
    private var landmark: Landmark
    
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
    
    var landmarkCategory: String {
        landmark.category.rawValue
    }
    
    var isFavorite: Bool {
        get { landmark.isFavorite }
        set { landmark.isFavorite = newValue }
    }
    
    var isFeatured: Bool {
        landmark.isFeatured
    }
    
    var featuredImage: String {
        isFeatured ? "\(landmarkName)_feature" : ""
    }
    
    var coordinates: CLLocationCoordinate2D {
        .init(latitude: landmark.coordinates.latitude, longitude: landmark.coordinates.longitude)
    }
}
