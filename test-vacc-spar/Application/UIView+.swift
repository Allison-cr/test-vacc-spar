//
//  UIView.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension View {
    func separateDouble(_ value: Double, integerFont: Font = .headline, fractionFont: Font = .subheadline) -> some View {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        let formattedValue = numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
        
        let components = formattedValue.split(separator: ",")
        
        return HStack(alignment: .firstTextBaseline, spacing: 3) {
            Text(String(components[0]))
                .font(.system(size: 20,weight: .bold))
                .foregroundStyle(.black)

            Text("\(components.count > 1 ? String(components[1]) : "00")")
                .font(.system(size: 16,weight: .bold))
                .offset(y: -3)
                .foregroundStyle(.black)
        }
    }
}
