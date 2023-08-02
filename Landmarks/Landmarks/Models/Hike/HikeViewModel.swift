//
//  HikeViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import Foundation

class HikeViewModel: ObservableObject {
    private(set) var hike: Hike
    
    init(_ hike: Hike){
        self.hike = hike
    }
}
