//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import SwiftUI

struct ProfileSummary: View {
    let profile: ProfileViewModel
    let hike: HikeViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day").hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike") .hueRotation(Angle(degrees: 180))
                    }
                }
                
                HikeView(viewModel: hike)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    private static let viewModels = ViewModelContainer()
    
    static var previews: some View {
        ProfileSummary(profile: viewModels.profile, hike: viewModels.hikes[0])
    }
}
