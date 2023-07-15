//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    let viewModel: LandmarkViewModel
    
    var body: some View {
        ScrollView {
            MapView(coordinates: viewModel.coordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: Image(viewModel.landmarkImage))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(viewModel.landmarkName)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                HStack {
                    Text(viewModel.landmarkPark)
                    Spacer()
                    Text(viewModel.landmarkState)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(viewModel.landmarkName)")
                    .font(.title2)
                Text(viewModel.landmarkDescription)
            }
            .padding()
            .navigationTitle(viewModel.landmarkName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(viewModel: ModelData().landmarks[0])
    }
}
