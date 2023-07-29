//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var viewModel: CategoryListViewModel
    
    var body: some View {
        NavigationView {
            
            List {
                Image(viewModel.featuredLandmarkImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(5.0)
                    .clipped()
                
                ForEach(viewModel.categoryRows, id: \.category) { row in
                    CategoryRow(viewModel: row)
                        .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData().categories)
    }
}
