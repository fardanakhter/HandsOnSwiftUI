//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct LandmarkList: View {
    let viewModel: LandmarkListViewModel
    
    @State private var showFavouritesOnly = true
    
    private var rows: [LandmarkViewModel] {
        viewModel.getLandmarks(withFilter: showFavouritesOnly)
    }
    
    var body: some View {
        NavigationView {
            List(rows) { viewModel in
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
            LandmarkList(viewModel: LandmarkListViewModel(landmarks: landmarks))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
