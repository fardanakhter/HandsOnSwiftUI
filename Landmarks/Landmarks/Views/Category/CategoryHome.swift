//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var categories: CategoryListViewModel
    
    var body: some View {
        NavigationView {
            List(categories.categoryRows, id: \.category) { row in
                Text(row.category)
            }
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
