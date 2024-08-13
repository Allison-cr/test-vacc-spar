//
//  CounterEnum.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

enum Per {
    case piece
    case perkg
    
    var description: String {
        switch self {
        case .piece:
            return "Шт"
        case .perkg:
            return "Кг"
        }
    }
}
