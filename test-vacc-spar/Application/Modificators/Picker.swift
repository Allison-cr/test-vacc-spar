//
//  Picker.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import SwiftUI

struct Picker: View {
    @Binding var state : Per
    @State var layout : Layout
    var body: some View {
            
        HStack {
            Button(action: {
                state = .piece
            }, label: {
                Text(Per.piece.description)
                    .lineLimit(1)
                    .font(.system(size: 14))
                    .foregroundStyle(state == .piece ? .black : .gray)
                    .padding(.vertical, 5)
                    .padding(.horizontal, layout == .grid ?  30 : 36)
                    .background(state == .piece ? .white : .clear)
                    .cornerRadius(8)
                Button(action: {
                    state = .perkg
                }, label: {
                    Text(Per.perkg.description)
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .foregroundStyle(state == .piece ? .gray : .black )
                        .padding(.vertical, 5)
                        .padding(.horizontal, layout == .grid ?  30 : 36)
                        .background(state == .piece ? .clear : .white )
                        .cornerRadius(8)
                })
            })
        }
        .padding(2)
        .background(.labelnavbar)
        .cornerRadius(6)
    }
}


//#Preview {
//    MainView(viewModel: MainViewModel(productModels: ProductModel.mock, router: Router()), state: true)
//}
