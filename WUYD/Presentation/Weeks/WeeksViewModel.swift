//
//  WeeksViewModel.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

final class WeeksViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var totalWeeks: Int = 0
    @Published var weeksLived: Int = 0
    let getTotalNumberOfWeeksUseCase: GetTotalNumberOfWeeksUseCaseProtocol
    let getWeeksLivedUseCase: GetWeeksLivedUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializers
    init(
        getTotalNumberOfWeeksUseCase: GetTotalNumberOfWeeksUseCaseProtocol,
        getWeeksLivedUseCase: GetWeeksLivedUseCaseProtocol
    ) {
        self.getTotalNumberOfWeeksUseCase = getTotalNumberOfWeeksUseCase
        self.getWeeksLivedUseCase = getWeeksLivedUseCase
        self.setUp()
    }
}

// MARK: - Private methods
private extension WeeksViewModel {
    func setUp() {
        getTotalNumberOfWeeks()
        getWeeksLived()
    }
    
    func getTotalNumberOfWeeks() {
        getTotalNumberOfWeeksUseCase
            .execute()
            .sink { result in
                switch result {
                case let .success(totalNumberOfWeeks):
                    self.totalWeeks = totalNumberOfWeeks
                case .failure(_):
                    return
                }
            }
            .store(in: &cancellables)
    }
    
    func getWeeksLived() {
        getWeeksLivedUseCase
            .execute()
            .sink { result in
                switch result {
                case let .success(weeksLived):
                    self.weeksLived = weeksLived
                case .failure(_):
                    return
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Property injection
extension WeeksViewModel {
    convenience init() {
        let userDefaultDataSource = BirthdayUserDefaultDataSource()
        let repository = BirthdayDataRepository(userDefaultDataSource: userDefaultDataSource)
        let getBirthdayUseCase = GetBirthdayUseCase(repository: repository)
        let getWeeksLivedUseCase = GetWeeksLivedUseCase(getBirthdayUseCase: getBirthdayUseCase)
        let getTotalNumberOfWeeksUseCase = GetTotalNumberOfWeeksUseCase()
        self.init(
            getTotalNumberOfWeeksUseCase: getTotalNumberOfWeeksUseCase,
            getWeeksLivedUseCase: getWeeksLivedUseCase
        )
    }
}

