//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Fardan Akhter on 22/07/2023.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
        GeometryReader { proxy in
            Path { path in
                
                var width = min(proxy.size.width, proxy.size.height)
                let height = width
                let xScale = 0.85
                let xOffset = (width * (1 - xScale)) / 2
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * 0.285 + HexagonParameters.adjustment
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        
                        control:
                            CGPoint(
                                x: width * segment.control.x + xOffset,
                                y: height * segment.control.y
                            )
                    )
                }
            }
            .fill(Gradient(colors: [Self.gradientStart, Self.gradientEnd]))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    private static  let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    private static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
