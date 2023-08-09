//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var viewModelContainer: ViewModelContainer
    @State private var draftProfile = ProfileViewModel(.default)
    
    private var isEditing: Bool {
        editMode?.wrappedValue == .active
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isEditing {
                    Button("Cancel", role: .cancel) {
                        draftProfile = viewModelContainer.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if isEditing {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = viewModelContainer.profile
                    }
                    .onDisappear {
                        viewModelContainer.profile = draftProfile
                    }
            }
            else {
                ProfileSummary(profile: draftProfile, hike: viewModelContainer.hikes[0])
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ViewModelContainer())
    }
}
