//
//  Landmark.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import Foundation
import CoreLocation

struct Landmark: Codable {
    let id: Int
    let name: String
    let category: String
    let city: String
    let state: String
    let park: String
    let description: String
    let imageName: String
    let coordinates: Coordinates
    let isFavorite: Bool
}

struct Coordinates: Codable {
    let longitude: Double
    let latitude: Double
}
