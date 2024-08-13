//
//  BasketView.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import SwiftUI

struct BasketView: View {
    @ObservedObject var basketViewModel: BasketViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Text("Корзина")
                    .font(.largeTitle)
                    .padding()
                if basketViewModel.items.isEmpty {
                    Text("Ваша корзина пуста")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(basketViewModel.items) { product in
                            HStack {
                                Text(product.name)
                                    .font(.system(size: 18))
                                Spacer()
                                Text("x\(product.quantity)")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                                Text("\((Double(product.quantity) * product.price).formatted()) Р")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BasketView(basketViewModel: BasketViewModel())
}
