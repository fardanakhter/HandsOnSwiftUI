//
//  ContentView.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let listDataModel = ModelData().landmarks
        let listViewModel = LandmarkListViewModel(landmarks: listDataModel)
        LandmarkList(viewModel: listViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
