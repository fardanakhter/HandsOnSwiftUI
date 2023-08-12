//
//  PageView.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/08/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    let pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static let featuredList = ViewModelContainer().landmarkList.featuredList
    static var previews: some View {
        PageView(pages: featuredList.map(FeatureCard.init))
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
