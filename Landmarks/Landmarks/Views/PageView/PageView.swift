//
//  PageView.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/08/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    @State private var pageNumber: Int = 0
    let pages: [Page]
    
    var body: some View {
        VStack {
            PageViewController(pageNumber: $pageNumber, pages: pages)
            Text("Current Page: \(pageNumber)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static let featuredList = ViewModelContainer().landmarkList.featuredList
    static var previews: some View {
        PageView(pages: featuredList.map(FeatureCard.init))
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
