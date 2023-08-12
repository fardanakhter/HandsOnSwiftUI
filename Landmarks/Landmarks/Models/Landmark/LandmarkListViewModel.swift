//
//  LandmarkListViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import Foundation

class LandmarkListViewModel {
    var list: [LandmarkViewModel]
    
    private var favoriteList: [LandmarkViewModel] {
        list.filter { $0.isFavorite }
    }
    
    var featuredList: [LandmarkViewModel] {
        list.filter { $0.isFeatured }
    }
    
    init(landmarks: [LandmarkViewModel]) {
        self.list = landmarks
    }
    
    func getLandmarks(withFilter isFavorite: Bool) -> [LandmarkViewModel] {
        isFavorite ? favoriteList : list
    }

}
