//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Fardan Akhter on 29/07/2023.
//

import SwiftUI

struct CategoryRow: View {
    var viewModel: CategoryRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.category)
                .padding(.bottom, 16)
                .font(.title3)
                .kerning(1.5)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16.0) {
                    ForEach(viewModel.landmarks) { row in
                        NavigationLink {
                            LandmarkDetail(landmark: row)
                        } label: {
                            CategoryItem(landmark: row)
                        }
                    }
                }
                .padding(.bottom, 16)
            }
        }
        .padding(.top, 8)
        .padding(.leading, 16)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static let categoryRows = ModelData().categories.categoryRows
    
    static var previews: some View {
        CategoryRow(viewModel: categoryRows[0])
    }
}
