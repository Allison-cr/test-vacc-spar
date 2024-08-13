//
//  BasketViewModel.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Combine

class BasketViewModel: ObservableObject {
    @Published var items: [ProductModel] = []
    
    func addToCart(_ product: ProductModel) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            items[index].quantity += 1
        } else {
            var newProduct = product
            newProduct.quantity = 1
            items.append(newProduct)
        }
    }
    
    func removeFromCart(_ product: ProductModel) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }
    
    func getQuantity(for product: ProductModel) -> Int {
        return items.first(where: { $0.id == product.id })?.quantity ?? 0
    }
}

