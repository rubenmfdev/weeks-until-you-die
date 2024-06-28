//
//  GetWeeksLivedUseCase.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

protocol GetWeeksLivedUseCaseProtocol {
    func execute() -> AnyPublisher<Result<Int, Error>, Never>
}

final class GetWeeksLivedUseCase: GetWeeksLivedUseCaseProtocol {
    
    // MARK: - Properties
    let getBirthdayUseCase: GetBirthdayUseCaseProtocol
    
    // MARK: - Initializers
    init(getBirthdayUseCase: GetBirthdayUseCaseProtocol) {
        self.getBirthdayUseCase = getBirthdayUseCase
    }
    
    // MARK: - Execute
    func execute() -> AnyPublisher<Result<Int, Error>, Never> {
        return getBirthdayUseCase.execute().flatMap { result -> AnyPublisher<Result<Int, Error>, Never> in
            switch result {
            case .success(let birthday):
                let weeksLived = self.calculateWeeksLived(since: birthday)
                return Just(.success(weeksLived))
                    .eraseToAnyPublisher()
                
            case .failure(let error):
                return Just(.failure(error))
                    .eraseToAnyPublisher()
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Private Methods
private extension GetWeeksLivedUseCase {
    func calculateWeeksLived(since birthday: Date) -> Int {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekOfYear], from: birthday, to: now)
        return components.weekOfYear ?? 0
    }
}
