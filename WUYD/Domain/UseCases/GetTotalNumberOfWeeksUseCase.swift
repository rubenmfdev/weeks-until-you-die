//
//  GetTotalNumberOfWeeksUseCase.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

protocol GetTotalNumberOfWeeksUseCaseProtocol {
    func execute() -> AnyPublisher<Result<Int, Error>, Never>
}

final class GetTotalNumberOfWeeksUseCase: GetTotalNumberOfWeeksUseCaseProtocol {
    
    // MARK: - Properties
    let averageLifeExpectancy = 3744
    
    // MARK: - Initializers

    
    // MARK: - Execute
    func execute() -> AnyPublisher<Result<Int, Error>, Never> {
        return Just(.success(averageLifeExpectancy))
            .eraseToAnyPublisher()
    }
}
