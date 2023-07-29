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
    
    var categories: CategoryListViewModel {
        let rows = Dictionary(grouping: landmarks, by: {$0.landmarkCategory}).map(CategoryRowViewModel.init)
        return CategoryListViewModel(categoryRows: rows)
    }
    
    var hikes: [Hike] = {
        DataLoader<[Hike]>.load(from: "hikeData.json")
    }()
}
