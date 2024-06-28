//
//  GetBirthdayUseCase.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

protocol GetBirthdayUseCaseProtocol {
    func execute() -> AnyPublisher<Result<Date, Error>, Never>
}

final class GetBirthdayUseCase: GetBirthdayUseCaseProtocol {
    
    // MARK: - Properties
    let repository: BirthdayRepository
    
    // MARK: - Initializers
    init(repository: BirthdayRepository) {
        self.repository = repository
    }
    
    // MARK: - Execute
    func execute() -> AnyPublisher<Result<Date, Error>, Never> {
        self.repository.getBirthday()
    }
}
