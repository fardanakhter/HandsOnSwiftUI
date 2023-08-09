//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject var viewModels = ViewModelContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModels)
        }
    }
}
