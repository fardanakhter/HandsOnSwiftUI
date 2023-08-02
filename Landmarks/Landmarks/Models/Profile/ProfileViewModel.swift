//
//  ProfileViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    private let profile: Profile
    
    init(_ profile: Profile = .default) {
        self.profile = profile
    }
    
    var username: String {
        profile.username
    }
    
    var prefersNotifications: Bool {
        profile.prefersNotifications
    }
    
    var seasonalPhoto: String {
        profile.seasonalPhoto.rawValue
    }
    
    var goalDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM,dd yyyy"
        let stringDate = formatter.string(from: profile.goalDate)
        return stringDate
    }
    
}
