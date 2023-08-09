//
//  CategoryListViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import Foundation

struct CategoryListViewModel {
    private(set) var list: [CategoryRowViewModel]
    
    init(categoryRows: [CategoryRowViewModel]) {
        self.list = categoryRows
    }
    
    var featuredLandmarkImage: String {
        getFeaturedLandmark().landmarkImage
    }
    
    private func getFeaturedLandmark() -> LandmarkViewModel {
        return list.flatMap{ $0.landmarks }.filter{ $0.isFeatured }[0]
    }
}

