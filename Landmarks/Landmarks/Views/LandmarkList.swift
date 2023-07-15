//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct LandmarkList: View {
    let viewModel: LandmarkListViewModel
    
    @State private var showFavouritesOnly = false
    
    private var rows: [LandmarkViewModel] {
        viewModel.getLandmarks(withFilter: showFavouritesOnly)
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavouritesOnly) {
                    Text("Favourites Only")
                }
                ForEach(rows) { row in
                    NavigationLink {
                        LandmarkDetail(viewModel: row)
                    } label: {
                        LandmarkRow(landmark: row)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    private static let landmarks = ModelData().landmarks
    
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 14"], id: \.self) { deviceName in
            LandmarkList(viewModel: LandmarkListViewModel(landmarks: landmarks))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
