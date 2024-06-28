//
//  BirthdayDataRepository.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

final class BirthdayDataRepository: BirthdayRepository {
    
    let userDefaultDataSource: BirthdayUserDefaultDataSourceProtocol
    
    init(userDefaultDataSource: BirthdayUserDefaultDataSourceProtocol) {
        self.userDefaultDataSource = userDefaultDataSource
    }
    
    func saveBirthday(birthday: Date) -> AnyPublisher<Result<Bool, Error>, Never> {
        self.userDefaultDataSource.saveBirthday(birthday: birthday)
    }
    
    func getBirthday() -> AnyPublisher<Result<Date, Error>, Never> {
        self.userDefaultDataSource.getBirthday()
    }

}
