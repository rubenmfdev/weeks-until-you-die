//
//  Item.swift
//  WUYD
//
//  Created by Ruben Marquez on 18/6/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
