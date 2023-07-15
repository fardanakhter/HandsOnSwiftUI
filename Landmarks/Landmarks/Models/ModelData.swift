//
//  ModelData.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import Foundation

class ModelData: ObservableObject {
    @Published var landmarks: [LandmarkViewModel] = {
        DataLoader<[Landmark]>.load(from: "landmarkData.json").map {
            LandmarkViewModel($0)
        }
    }()
}
