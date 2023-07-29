//
//  CategoryListViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    private(set) var categoryRows: [CategoryRowViewModel]
    
    init(categoryRows: [CategoryRowViewModel]) {
        self.categoryRows = categoryRows
    }
    
    var featuredLandmarkImage: String {
        getFeaturedLandmark().landmarkImage
    }
    
    private func getFeaturedLandmark() -> LandmarkViewModel {
        return categoryRows.flatMap{ $0.landmarks }.filter{ $0.isFeatured }[0]
    }
}

