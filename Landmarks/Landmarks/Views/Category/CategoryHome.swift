//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var viewModelContainer: ViewModelContainer
    
    private var category: CategoryListViewModel {
        viewModelContainer.categoryList
    }
    private var hike: HikeViewModel {
        viewModelContainer.hikes[0]
    }
    
    @State private var isShowingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Image(category.featuredLandmarkImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(5.0)
                    .clipped()
                
                ForEach(category.list, id: \.category) { row in
                    CategoryRow(viewModel: row)
                        .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.plain)
            .toolbar{
                Button {
                    isShowingProfile.toggle()
                } label: {
                    Label("Open Profile", systemImage: "person.crop.circle")
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $isShowingProfile) {
                ProfileHost()
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ViewModelContainer())
    }
}
