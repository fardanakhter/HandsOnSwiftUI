//
//  ProfileViewModel.swift
//  Landmarks
//
//  Created by Fardan Akhter on 02/08/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published private var profile: Profile
    
    init(_ profile: Profile = .default) {
        self.profile = profile
    }
    
    var username: String {
        get {
            profile.username
        }
        set {
            profile.username = newValue
        }
    }
    
    var prefersNotifications: Bool {
        get {
            profile.prefersNotifications
        }
        set {
            profile.prefersNotifications = newValue
        }
    }
    
    var seasonalPhotos: [String] {
        Profile.Season.allCases.map{ $0.rawValue }
    }
    
    var seasonalPhoto: String {
        get {
            profile.seasonalPhoto.rawValue
        }
        set {
            profile.seasonalPhoto = Profile.Season(rawValue: newValue)!
        }
    }
    
    var goalDate: Date {
        get {
            profile.goalDate
        }
        set {
            profile.goalDate = newValue
        }
    }
    
}
