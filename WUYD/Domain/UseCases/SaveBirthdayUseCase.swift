//
//  SaveBirthdayUseCase.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

protocol SaveBirthdayUseCaseProtocol {
    func execute(input: SaveBirthdayUseCaseInput) -> AnyPublisher<Result<Bool, Error>, Never>
}

final class SaveBirthdayUseCase: SaveBirthdayUseCaseProtocol {
    
    let repository: BirthdayRepository
    
    init(repository: BirthdayRepository) {
        self.repository = repository
    }
    
    func execute(input: SaveBirthdayUseCaseInput) -> AnyPublisher<Result<Bool, Error>, Never> {
        self.repository.saveBirthday(birthday: input.birthday)
    }
}

struct SaveBirthdayUseCaseInput {
    let birthday: Date
}
