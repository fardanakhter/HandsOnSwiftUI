//
//  PageViewController.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/08/2023.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    @Binding var pageNumber: Int
    var pages: [Page]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.dataSource = context.coordinator
        pageVC.delegate = context.coordinator
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.setViewControllers([context.coordinator.viewControllers[pageNumber]],
                                            direction: UIPageViewController.NavigationDirection.forward,
                                            animated: true
        )
    }
    
    // MARK:- Coordinator
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
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
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let currentPage = pageViewController.viewControllers?.first,
               let index = viewControllers.firstIndex(of: currentPage) {
                parent.pageNumber = index
            }
            
        }
        
    }
}
