//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: LandmarkViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(landmark.landmarkImage)
                .renderingMode(.original)
                .resizable()
                .cornerRadius(5.0)
                .frame(width: 155, height: 155)
                .aspectRatio(1.0, contentMode: .fit)
                .shadow(radius: 1.5)
            Text(landmark.landmarkName)
                .font(.subheadline)
                .foregroundColor(.black)
                .kerning(1.2)
            Spacer()
        }
        .frame(width: 155)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ViewModelContainer().landmarkList.list[6])
    }
}
