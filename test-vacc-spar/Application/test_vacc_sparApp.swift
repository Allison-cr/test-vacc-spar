//
//  test_vacc_sparApp.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import SwiftUI

@main
struct test_vacc_sparApp: App {
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
