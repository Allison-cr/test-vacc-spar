//
//  MainViewModel.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation


class MainViewModel: ObservableObject {
    @Published var productModels: [ProductModel]
    private let router: Router

    
    init(productModels: [ProductModel], router: Router) {
        self.productModels = productModels
        self.router = router
    }
    
}
