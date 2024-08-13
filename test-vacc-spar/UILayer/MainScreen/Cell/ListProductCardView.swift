//
//  ListProductCardView.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation

import SwiftUI

struct ListProductCardView: View {
    var viewModel: MainViewModel
    @Binding var product: ProductModel
    var basketViewModel : BasketViewModel
    @State var format : Per = .piece
    var body: some View {
        ZStack {
            Color.white
            HStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Image(product.image)
                        .padding(6)
                    Text(product.bonus)
                        .font(.system(size: 10))
                        .padding(.leading, 25)
                        .padding(3)
                        .background(product.bonus != "" ? .badge : .clear)
                        .cornerRadius(6, corners: [.topRight, .bottomRight])
                        .foregroundColor(.white)
                    VStack(spacing: 0) {
                        Spacer()
                        HStack(spacing: 0) {
                            Spacer()
                            Text(product.discont == 0 ? "" : "\(product.discont) % ")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.discontcolor)
                                .padding(.trailing, 16)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.38)
                .cornerRadius(15)
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        VStack(alignment: .leading){
                            HStack(spacing: 4) {
                                Image(.star)
                                Text("\(product.rating.formatted())")
                                Text("|")
                                Text(product.feedback)
                                    .foregroundStyle(.text.opacity(0.6))
                            }
                            Text(product.name)
                                .foregroundStyle(.black)
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            VStack(spacing: 16) {
                                Button(action: {}, label: {
                                    Image(.labelCom)
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                })
                                Button(action: {
                                    product.favorite.toggle()
                                }, label: {
                                    Image(systemName: product.favorite ? "heart.fill" : "heart")
                                        .foregroundColor(product.favorite ? .counter : .text)
                                        .font(.system(size: 20))
                                })
                            }
                            .padding(8)
                            .background(.white.opacity(0.7))
                            .cornerRadius(16)
                            Spacer()
                        }
                    }
                    Spacer()
                    if basketViewModel.getQuantity(for: product) == 0 {
                        HStack(spacing: 0) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("")
                                        .separateDouble(product.price)
                                    Image(.perAmountIcon)
                                }
                                Text("\(product.discontedPrice  .formatted())")
                                    .foregroundColor(.text.opacity(0.6))
                                    .strikethrough(true, color: .text.opacity(0.6))
                            }
                            Spacer()
                            Button(action: {
                                basketViewModel.addToCart(product)
                            }, label: {
                                Image(.counterOrigin)
                            })
                        }
                    }
                    else {
                        VStack(spacing: 10) {
                            Picker(state: $format, layout: .list)
                            HStack {
                                Button(action: {
                                    basketViewModel.removeFromCart(product)
                                }, label: {
                                    Image(systemName: "minus")
                                        .padding(12)
                                })
                                VStack(spacing: 0) {
                                    Text(format == .perkg ?  "\(basketViewModel.getQuantity(for: product)) Кг" : "\(basketViewModel.getQuantity(for: product)) Шт ")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("\((Double(basketViewModel.getQuantity(for: product)) * product.price).formatted())" )
                                        .font(.system(size: 12))
                                }
                                .padding(.horizontal, 24)
                                Button(action: {
                                    basketViewModel.addToCart(product)
                                }, label: {
                                    Image(systemName: "plus")
                                })
                                    .padding(12)
                            }
                            .background(.counter)
                            .cornerRadius(40)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.leading, 16)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 24)
        }
        .border(Color.separator, width: 1)

    }
}

