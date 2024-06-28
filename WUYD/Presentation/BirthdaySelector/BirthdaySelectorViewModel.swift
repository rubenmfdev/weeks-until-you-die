//
//  BirthdaySelectorViewModel.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import SwiftUI
import Combine

final class BirthdaySelectorViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var selectedDate: Date = Date()
    let saveBirthdayUseCase: SaveBirthdayUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializers
    init(
        saveBirthdayUseCase: SaveBirthdayUseCaseProtocol
    ) {
        self.saveBirthdayUseCase = saveBirthdayUseCase
    }
}

// MARK: - Public methods
extension BirthdaySelectorViewModel {
    func saveBirthday(finished: @escaping () -> Void) {
        saveBirthdayUseCase
            .execute(input: .init(birthday: selectedDate))
            .sink { result in
                finished()
                return
            }
            .store(in: &cancellables)
    }
}

// MARK: - Property injection
extension BirthdaySelectorViewModel {
    convenience init() {
        let userDefaultDataSource = BirthdayUserDefaultDataSource()
        let repository = BirthdayDataRepository(userDefaultDataSource: userDefaultDataSource)
        let saveBirthdayUseCase = SaveBirthdayUseCase(repository: repository)
        self.init(saveBirthdayUseCase: saveBirthdayUseCase)
    }
}

