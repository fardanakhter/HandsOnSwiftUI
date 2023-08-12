//
//  PageViewController.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/08/2023.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> some UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.setViewControllers([UIHostingController(rootView: pages[0])],
            direction: UIPageViewController.NavigationDirection.forward,
            animated: true
        )
    }
}
