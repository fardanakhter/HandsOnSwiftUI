//
//  ContentView.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    private static var viewModel: LandmarkListViewModel {
        let listDataModel = ModelData().landmarks
        return LandmarkListViewModel(landmarks: listDataModel)
    }
    
    static var previews: some View {
        ContentView()
            .environmentObject(viewModel)
    }
}
