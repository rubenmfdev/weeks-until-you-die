//
//  BirthdaySelectorViewModel.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import SwiftUI
import Combine

class BirthdaySelectorViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
}
