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

class CategoryListViewModel: ObservableObject {
    private(set) var categoryRows: [CategoryRowViewModel]
    
    init(categoryRows: [CategoryRowViewModel]) {
        self.categoryRows = categoryRows
    }
}

class CategoryRowViewModel {
    private(set) var category: String
    private(set) var landmarks: [LandmarkViewModel]
    
    init(category: String, landmarks: [LandmarkViewModel]) {
        self.category = category
        self.landmarks = landmarks
    }
}
