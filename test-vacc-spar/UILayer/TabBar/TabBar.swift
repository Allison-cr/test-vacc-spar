//
//  TabBar.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @StateObject private var router = Router.shared
    @StateObject private var basketViewModel = BasketViewModel()
    var body: some View {
        TabView {
            NavigationStack(path: $router.path) {
                MainView(viewModel: MainViewModel(productModels: ProductModel.mock, router: router), basketViewModel: basketViewModel)
            }
            .tabItem {
                Label("Main", systemImage: "house")
            }
            NavigationStack(path: $router.path) {
                BasketView(basketViewModel: basketViewModel)
            }
            .tabItem {
                Label("Basket", systemImage: "person")
            }
        }
    }
}

