//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @Binding var landmark: LandmarkViewModel
    
    var body: some View {
        ScrollView {
            MapView(coordinates: landmark.coordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: Image(landmark.landmarkImage))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, spacing: 8.0) {
                HStack {
                    Text(landmark.landmarkName)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                    FavoriteButton(isSet: $landmark.isFavorite)
                }
                HStack {
                    Text(landmark.landmarkPark)
                    Spacer()
                    Text(landmark.landmarkState)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.landmarkName)")
                    .font(.title2)
                Text(landmark.landmarkDescription)
            }
            .padding()
            .navigationTitle(landmark.landmarkName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    @State static private var landmark = ViewModelContainer().landmarkList.list[0]
    
    static var previews: some View {
        LandmarkDetail(landmark: $landmark)
    }
}
