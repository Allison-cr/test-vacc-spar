//
//  Main.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation
import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var basketViewModel: BasketViewModel
    @State var state : Bool = true
    
    let columns = [
          GridItem(.flexible()),
          GridItem(.flexible())
      ]
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                
                Button(action: {
                    state.toggle()
                }, label: {
                    Image(state ? .navBarGrid : .navBarList)
                        .padding(12)
                        .background(.labelnavbar)
                        .cornerRadius(12)
                        .padding(.leading, 8)
                        .padding(.bottom, 5)
                })
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.separator)
                if state {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.productModels.indices, id: \.self) { index in
                                GridProductCardView(
                                    product: $viewModel.productModels[index],
                                    viewModel: viewModel,
                                    basketViewModel: basketViewModel
                                )
                            }
                        }
                        .padding(.top, 8)
                    }
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.productModels.indices, id: \.self) { index in
                                ListProductCardView(viewModel: viewModel,
                                                    product: $viewModel.productModels[index],
                                                    basketViewModel: basketViewModel
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    MainView(viewModel: MainViewModel(productModels: ProductModel.mock, router: Router()), basketViewModel: BasketViewModel(), state: false)
}
