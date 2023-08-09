//
//  CategoryRowViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import Foundation

struct CategoryRowViewModel {
    private(set) var category: String
    private(set) var landmarks: [LandmarkViewModel]
    
    init(category: String, landmarks: [LandmarkViewModel]) {
        self.category = category
        self.landmarks = landmarks
    }
}
