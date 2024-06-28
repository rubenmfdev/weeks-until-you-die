//
//  MainCoordinatorView.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import SwiftUI

struct MainCoordinatorView: View {
    @StateObject var coordinator = MainCoordinator()

    var body: some View {
        switch coordinator.currentView {
        case .birthdaySelector:
            BirthdaySelectorView() {
                coordinator.showWeeksView()
            }
        case .weeksView:
            WeeksView()
        }
    }
}

struct MainCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        MainCoordinatorView()
    }
}
