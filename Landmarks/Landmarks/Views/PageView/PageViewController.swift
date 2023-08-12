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
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.dataSource = context.coordinator
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.setViewControllers([context.coordinator.viewControllers[0]],
            direction: UIPageViewController.NavigationDirection.forward,
            animated: true
        )
    }
    
    // MARK:- Coordinator
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        let parent: PageViewController
        let viewControllers: [UIViewController]
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
            self.viewControllers = parent.pages.map(UIHostingController.init)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
            return index == 0 ? viewControllers.last : viewControllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
            return index == viewControllers.count - 1 ? viewControllers.first : viewControllers[index + 1]
        }
    }
    
}
