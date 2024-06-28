//
//  MainCoordinator.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var currentView: CoordinatorView = .birthdaySelector
    
    enum CoordinatorView {
        case birthdaySelector
        case weeksView
    }
    
    func showWeeksView() {
        currentView = .weeksView
    }
}
