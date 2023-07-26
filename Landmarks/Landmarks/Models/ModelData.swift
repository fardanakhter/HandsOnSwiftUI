//
//  ModelData.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import Foundation

class ModelData {
    var landmarks: [LandmarkViewModel] = {
        DataLoader<[Landmark]>.load(from: "landmarkData.json").map {
            LandmarkViewModel($0)
        }
    }()
    
    var hikes = DataLoader<[Hike]>.load(from: "hikeData.json")
}
