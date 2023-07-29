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
}

