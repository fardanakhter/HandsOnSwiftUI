//
//  LandmarkListViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import Foundation

class LandmarkListViewModel: ObservableObject {
    @Published var list: [LandmarkViewModel]
    
    private var favoriteList: [LandmarkViewModel] {
        list.filter {
            $0.isFavorite
        }
    }
    
    init(landmarks: [LandmarkViewModel]) {
        self.list = landmarks
    }
    
    func getLandmarks(withFilter isFavorite: Bool) -> [LandmarkViewModel] {
        isFavorite ? favoriteList : list
    }

}
