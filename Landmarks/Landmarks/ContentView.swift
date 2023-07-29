//
//  ContentView.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .list
    
    enum Tab: Hashable {
        case featured
        case list
        
        var display: String {
            switch self {
            case .featured: return "Featured"
            case .list: return "List"
            }
        }
    }
    
    var body: some View {
        TabView(selection: $selection) {
            LandmarkList()
                .tabItem {
                    Label(Tab.list.display, systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            CategoryHome()
                .tabItem {
                    Label(Tab.featured.display, systemImage: "star")
                }
                .tag(Tab.featured)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    private static var landmarkListViewModel: LandmarkListViewModel {
        let listDataModel = ModelData().landmarks
        return LandmarkListViewModel(landmarks: listDataModel)
    }
    
    private static var categoryListViewModel: CategoryListViewModel {
        return ModelData().categories
    }
    
    static var previews: some View {
        ContentView()
            .environmentObject(landmarkListViewModel)
            .environmentObject(categoryListViewModel)
    }
}
