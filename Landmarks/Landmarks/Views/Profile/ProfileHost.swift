//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var defaultProfile = ProfileViewModel(.default)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                EditButton()
            }
            
            if (editMode?.wrappedValue.isEditing ?? false) {
                ProfileEditor(profile: $defaultProfile)
            }
            else {
                ProfileSummary()
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    
    private static let hikes = ModelData().hikes
    private static let profile = ProfileViewModel()
    
    static var previews: some View {
        ProfileHost()
            .environmentObject(hikes[0])
            .environmentObject(profile)
    }
}
