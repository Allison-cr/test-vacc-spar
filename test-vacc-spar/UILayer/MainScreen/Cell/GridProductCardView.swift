//
//  GridProductCardView.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import SwiftUI

struct GridProductCardView: View {
    @Binding var product: ProductModel
    var viewModel: MainViewModel
    var basketViewModel : BasketViewModel
    @State var format : Per = .piece

    var body: some View {
        ZStack {
            Color.white
            VStack() {
                ZStack {
                    Image(product.image)
                        .resizable()
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product.bonus)
                                .font(.system(size: 10))
                                .padding(3)
                                .background(product.bonus != "" ? .badge : .clear)
                                .cornerRadius(6, corners: [.topRight, .bottomRight])
                                .foregroundColor(.white)
                            Spacer()
                            HStack {
                                Image(.star)
                                    .foregroundColor(.yellow)
                                Text("\(product.rating.formatted())")
                            }
                            .padding(.leading, 5)
                        }
                        Spacer()
                        VStack {
                            VStack(spacing: 16) {
                                Image(.labelCom)
                                Button(action: {
                                    product.favorite.toggle()
                                }, label: {
                                    Image(systemName: product.favorite ? "heart.fill" : "heart")
                                        .foregroundColor(product.favorite ? .counter : .text)

                                })
                            }
                            .padding(8)
                            .background(.white.opacity(0.7))
                            .cornerRadius(16)
                            .padding(5)
                            Spacer()
                            Text("\(product.discont) % ")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.discontcolor)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.45,height: UIScreen.main.bounds.width * 0.45)
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.system(size: 12))
                        .foregroundColor(.text.opacity(0.8))
                }
                    Spacer()
                if basketViewModel.getQuantity(for: product) == 0 {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("")
                                    .separateDouble(product.price)
                                Text("\(product.discontedPrice  .formatted())")
                                    .foregroundColor(.text.opacity(0.6))
                                    .strikethrough(true, color: .text.opacity(0.6))
                            }
                            Spacer()
                            Button(action: {
                                product.quantity += 1
                                basketViewModel.addToCart(product)
                            }, label: {
                                Image(.counterOrigin)
                                    .padding(4)
                    
                            })
                        }
                        .padding(.leading, 8)
                    }
                    else {
                        VStack(alignment: .center, spacing: 5) {
                            Picker(state: $format, layout: .grid)
                            HStack {
                                Button(action: {
                                    product.quantity -= 1
                                    basketViewModel.removeFromCart(product)
                                }, label: {
                                    Image(systemName: "minus")
                                        .padding(12)
                                })
                                VStack(spacing: 0) {
                                    Text(format == .perkg ? "\(basketViewModel.getQuantity(for: product) ) Кг" : "\(basketViewModel.getQuantity(for: product) ) Шт")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("\((Double(basketViewModel.getQuantity(for: product) ) * product.price).formatted()) Р" )
                                        .font(.system(size: 12))
                                }
                                .padding(.horizontal, 12)
                                Button(action: {
                                    product.quantity += 1
                                    basketViewModel.addToCart(product)
                                }, label: {
                                    Image(systemName: "plus")
                                        .padding(12)
                                })
                            }
                            .background(.counter)
                            .cornerRadius(40)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.top, 8)
                .padding(.vertical, 4)
            
        }
        .cornerRadius(14)
        .frame(width: UIScreen.main.bounds.width * 0.47,height: UIScreen.main.bounds.width * 0.45 * 1.8)
        .shadow(radius: 2)
    }
}

#Preview {
    GridProductCardView(product: .constant(ProductModel.mock[1]), viewModel: MainViewModel(productModels: ProductModel.mock, router: Router()), basketViewModel: BasketViewModel())
}
//#Preview {
//    MainView(viewModel: MainViewModel(productModels: ProductModel.mock, router: Router()), state: false)
//}
