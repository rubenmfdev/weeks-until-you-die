//
//  BirthdayRepository.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

protocol BirthdayRepository {
    func saveBirthday(birthday: Date) -> AnyPublisher<Result<Bool, Error>, Never>
    func getBirthday() -> AnyPublisher<Result<Date, Error>, Never>
}
