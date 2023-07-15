//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavouritesOnly = false
    
    private var filteredLandmarks: [LandmarkViewModel] {
        landmarks.filter {
            showFavouritesOnly ? $0.isFavorite : true
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredLandmarks) { viewModel in
                NavigationLink {
                    LandmarkDetail(viewModel: viewModel)
                } label: {
                    LandmarkRow(landmark: viewModel)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 14"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
