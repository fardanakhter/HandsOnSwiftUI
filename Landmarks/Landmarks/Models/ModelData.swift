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
    
    var categories: [CategoryListViewModel] {
        Dictionary(grouping: landmarks, by: {$0.landmarkCategory}).map(CategoryListViewModel.init)
    }
}


class CategoryListViewModel: ObservableObject {
    private(set) var category: String
    private(set) var landmarks: [LandmarkViewModel]
    
    init(category: String, landmarks: [LandmarkViewModel]) {
        self.category = category
        self.landmarks = landmarks
    }
}
