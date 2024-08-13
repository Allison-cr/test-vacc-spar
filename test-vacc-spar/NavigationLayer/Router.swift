//
//  Router.swift
//  test-vacc-spar
//
//  Created by Alexander Suprun on 13.08.2024.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case homeDetail(String)
    case profile
    case settings
    case registration
}

final class Router: ObservableObject {
    static let shared = Router()
    
    @Published var path = [Route]()
    
    func showHomeDetail(for item: String) {
        path.append(.homeDetail(item))
    }
    
    func showProfile() {
        path.append(.profile)
    }
    
    func showRegistration() {
        path.append(.registration)
    }
    
    func showSettings() {
        path.append(.settings)
    }
    
    func backToRoot() {
        path.removeAll()
    }
    
    func back() {
        path.removeLast()
    }
}
