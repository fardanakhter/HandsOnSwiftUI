//
//  FeaturedCard.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/08/2023.
//

import SwiftUI

struct FeaturedCard: View {
    var landmark: LandmarkViewModel

    var body: some View {
        Image(landmark.featuredImage)
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    
    var landmark: LandmarkViewModel
    
    var gradientOverlay: LinearGradient {
        .linearGradient(Gradient(colors: [.black.opacity(0.3), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradientOverlay
            VStack(alignment: .leading, spacing: 8.0){
                Text(landmark.landmarkName)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .bold()
                Text(landmark.landmarkCategory)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .padding(16)
        }
    }
    
}

struct FeaturedCard_Previews: PreviewProvider {
    private static let landmarks = ViewModelContainer().landmarkList.list
    
    static var previews: some View {
        FeaturedCard(landmark: landmarks[3])
    }
}
