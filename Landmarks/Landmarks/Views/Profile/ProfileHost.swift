//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import SwiftUI

struct ProfileHost: View {
    @State private var profile = Profile.default
    
    var body: some View {
        ProfileSummary(profile: profile)
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
