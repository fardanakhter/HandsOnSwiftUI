/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndSlide: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .scale.combined(with: .opacity))
    }
}

struct HikeView: View {
    var viewModel: HikeViewModel
    
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: viewModel.hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(viewModel.hike.name)
                        .font(.headline)
                    Text(viewModel.hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1.0)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(viewModel: viewModel)
                    .transition(.moveAndSlide)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            let viewModel = ViewModelContainer().hikes[0]
            HikeView(viewModel: viewModel).padding()
            Spacer()
        }
    }
}
