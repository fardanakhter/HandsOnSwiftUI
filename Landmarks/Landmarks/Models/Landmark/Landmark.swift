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
    let category: Category
    let city: String
    let state: String
    let park: String
    let description: String
    let imageName: String
    let coordinates: Coordinates
    var isFavorite: Bool
    
    enum Category: String, Codable {
        case rivers = "Rivers"
        case lakes = "Lakes"
        case mountains = "Mountains"
    }
}

struct Coordinates: Codable {
    let longitude: Double
    let latitude: Double
}
