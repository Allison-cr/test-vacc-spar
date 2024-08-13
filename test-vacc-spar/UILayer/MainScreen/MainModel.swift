//
//  ProductModel.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation

// MARK: - ProductModel

struct ProductModel: Identifiable {
    
    // MARK: - Properties
    
    /// The iID of 'Product"
    let id = UUID()

    /// The name of 'Product"
    let name : String
    
    /// The image of 'Product"
    let image : String
    
    /// The price of 'Product"
    let price : Double
    
    /// The discontedPrice of 'Product"
    let discontedPrice: Double
    
    /// The rating of 'Product"
    let rating: Double
    
    /// The bonus of 'Product"
    let bonus: String
    
    /// The feedback of 'Product"
    let feedback: String
    
    /// The discont of 'Product"
    let discont: Int
    
    /// The quantity of 'Product"
    var quantity: Int
    
    var favorite: Bool
}

//MARK: - Mock

extension ProductModel {
    static let mock = [
        ProductModel(
            name: "сыр Ламбер 500/0 230г",
            image: "tovar_1",
            price: 99.90,
            discontedPrice: 199.0,
            rating: 4.1,
            bonus: "Удар по ценам",
            feedback: "19 отзывов",
            discont: 15,
            quantity: 0,
            favorite: false
        ),
        ProductModel(
            name: "сыр Ламбер 500/0 230г",
            image: "tovar_1",
            price: 99.90,
            discontedPrice: 199.0,
            rating: 4.1,
            bonus: "",
            feedback: "19 отзывов",
            discont: 25,
            quantity: 0,
            favorite: true

        ),
        ProductModel(
            name: "сыр Ламбер 500/0 230г",
            image: "tovar_1",
            price: 99.90,
            discontedPrice: 199.0,
            rating: 4.1,
            bonus: "Удар по ценам",
            feedback: "19 отзывов",
            discont: 0,
            quantity: 0,
            favorite: false
        ),
        ProductModel(
            name: "сыр Ламбер 500/0 230г",
            image: "tovar_1",
            price: 99.90,
            discontedPrice: 199.0,
            rating: 4.1,
            bonus: "Удар по ценам",
            feedback: "19 отзывов",
            discont: 0,
            quantity: 0,
            favorite: false
        ),
        ProductModel(
            name: "сыр Ламбер 500/0 230г",
            image: "tovar_1",
            price: 99.90,
            discontedPrice: 199.0,
            rating: 4.1,
            bonus: "",
            feedback: "19 отзывов",
            discont: 0,
            quantity: 0,
            favorite: false
        ),
        ProductModel(
            name: "сыр Ламбер 500/0 230г",
            image: "tovar_1",
            price: 99.90,
            discontedPrice: 199.0,
            rating: 4.1,
            bonus: "",
            feedback: "19 отзывов",
            discont: 0,
            quantity: 0,
            favorite: false
        )
    ]
}
