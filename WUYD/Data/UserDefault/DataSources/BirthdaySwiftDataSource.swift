//
//  BirthdayUserDefaultDataSource.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import Combine

protocol BirthdayUserDefaultDataSourceProtocol {
    func saveBirthday(birthday: Date) -> AnyPublisher<Result<Bool, Error>, Never>
    func getBirthday() -> AnyPublisher<Result<Date, Error>, Never>
}

final class BirthdayUserDefaultDataSource: BirthdayUserDefaultDataSourceProtocol {
    
    let userDefaults: UserDefaults
    let birthdayKey = "user_birthday"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveBirthday(birthday: Date) -> AnyPublisher<Result<Bool, Error>, Never> {
        return Future { promise in
            do {
                let dateData = try JSONEncoder().encode(birthday)
                self.userDefaults.set(dateData, forKey: self.birthdayKey)
                promise(.success(.success(true)))
            } catch {
                promise(.success(.failure(error)))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getBirthday() -> AnyPublisher<Result<Date, Error>, Never> {
        return Future { promise in
            if let dateData = self.userDefaults.data(forKey: self.birthdayKey) {
                do {
                    let birthday = try JSONDecoder().decode(Date.self, from: dateData)
                    promise(.success(.success(birthday)))
                } catch {
                    promise(.success(.failure(error)))
                }
            } else {
                let error = NSError(domain: "BirthdayUserDefaultsDataSource", code: 1, userInfo: [NSLocalizedDescriptionKey: "Birthday not found"])
                promise(.success(.failure(error)))
            }
        }
        .eraseToAnyPublisher()
    }
}
