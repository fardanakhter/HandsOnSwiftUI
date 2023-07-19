//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Fardan Akhter on 19/07/2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Favorite Landmark Detail", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
