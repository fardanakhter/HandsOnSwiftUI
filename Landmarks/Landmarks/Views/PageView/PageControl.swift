//
//  PageControl.swift
//  Landmarks
//
//  Created by Fardan Akhter on 13/08/2023.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    @Binding var currentPage: Int
    let numberOfPages: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.addTarget(context.coordinator,
            action: #selector(Coordinator.updatePageControl(sender:)),
            for: .valueChanged
        )
        return pageControl
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        (uiView as! UIPageControl).currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        let parent: PageControl
        
        init(_ pageControl: PageControl) {
            self.parent = pageControl
        }
        
        @objc func updatePageControl(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
}
