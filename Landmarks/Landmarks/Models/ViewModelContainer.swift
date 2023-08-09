//
//  ModelData.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import Foundation

class ViewModelContainer: ObservableObject {
    @Published var profile: ProfileViewModel = ProfileViewModel()
    
    @Published var landmarkList: LandmarkListViewModel = {
        LandmarkListViewModel.init(landmarks: getLandmarks())
    }()
    
    @Published var categoryList: CategoryListViewModel = {
        let landmarks = getLandmarks()
        let rows = Dictionary(grouping: landmarks, by: {$0.landmarkCategory}).map(CategoryRowViewModel.init)
        return CategoryListViewModel(categoryRows: rows)
    }()
    
    var hikes: [HikeViewModel] = {
        getHikes().map(HikeViewModel.init)
    }()
    
    static private func getLandmarks() -> [LandmarkViewModel] {
        let landmarks: [Landmark] = DataLoader.load(from: "landmarkData.json")
        let landmarkViewModel = landmarks.map(LandmarkViewModel.init)
        return landmarkViewModel
    }
    
    static private func getHikes() -> [Hike] {
        DataLoader.load(from: "hikeData.json")
    }
}
