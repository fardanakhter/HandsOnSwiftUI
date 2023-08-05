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
    
    private var isEditing: Bool {
        editMode?.wrappedValue == .active
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isEditing {
                    Button("Cancel", role: .cancel) {
                        defaultProfile = profileViewModel
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if isEditing {
                ProfileEditor(profile: $defaultProfile)
                    .onAppear {
                        defaultProfile = profileViewModel
                    }
                    .onDisappear {
                        profileViewModel.mock(defaultProfile)
                    }
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
