//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: LandmarkViewModel
    
    var body: some View {
        HStack {
            Image(landmark.landmarkImage)
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.landmarkName)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let modelData = ModelData()
            LandmarkRow(landmark: modelData.landmarks[0])
            LandmarkRow(landmark: modelData.landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
