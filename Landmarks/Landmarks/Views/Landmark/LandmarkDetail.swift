//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Fardan Akhter on 15/07/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var viewModels: ViewModelContainer
    var landmark: LandmarkViewModel
    
    private var favoriteProperty: Binding<Bool> {
        $viewModels.landmarkList.list.first{ $0.id == landmark.id }!.isFavorite
    }
    
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
                    FavoriteButton(isSet: favoriteProperty)
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
    private static let viewModels = ViewModelContainer()
    private static let landmarks = viewModels.landmarkList.list
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
            .environmentObject(viewModels)
    }
}
