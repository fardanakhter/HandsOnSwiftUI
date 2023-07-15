//
//  LandmarkListViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import Foundation

class LandmarkListViewModel {
    private let allLandmarks: [LandmarkViewModel]
    
    private var favoriteLandmarks: [LandmarkViewModel] {
        allLandmarks.filter {
            $0.isFavorite
        }
    }
    
    init(landmarks: [LandmarkViewModel]) {
        self.allLandmarks = landmarks
    }
    
    func getLandmarks(withFilter isFavorite: Bool) -> [LandmarkViewModel] {
        isFavorite ? favoriteLandmarks : allLandmarks
    }
}
