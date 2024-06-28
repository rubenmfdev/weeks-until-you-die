//
//  BirthdaySelectorViewModel.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import SwiftUI
import Combine
import SwiftData

final class BirthdaySelectorViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    
    let saveBirthdayUseCase: SaveBirthdayUseCaseProtocol
    
    init(
        saveBirthdayUseCase: SaveBirthdayUseCaseProtocol
    ) {
        self.saveBirthdayUseCase = saveBirthdayUseCase
    }
}

extension BirthdaySelectorViewModel {
    convenience init() {
        let userDefaultDataSource = BirthdayUserDefaultDataSource()
        let repository = BirthdayDataRepository(userDefaultDataSource: userDefaultDataSource)
        let saveBirthdayUseCase = SaveBirthdayUseCase(repository: repository)
        self.init(saveBirthdayUseCase: saveBirthdayUseCase)
    }
}

