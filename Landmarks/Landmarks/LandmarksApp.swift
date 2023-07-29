//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    static let modelData = ModelData()
    
    @StateObject var landmarkListViewModel = {
        LandmarkListViewModel(landmarks: modelData.landmarks)
    }()
    
    @StateObject var categoryListViewModel = modelData.categories
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(landmarkListViewModel)
                .environmentObject(categoryListViewModel)
        }
    }
}
