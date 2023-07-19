//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var viewModel: LandmarkListViewModel
    
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
                        LandmarkDetail(landmark: row)
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
    private static var landmarks: LandmarkListViewModel {
        LandmarkListViewModel(landmarks: ModelData().landmarks)
    }

    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 14"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(landmarks)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
