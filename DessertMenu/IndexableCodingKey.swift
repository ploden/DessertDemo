//
//  IndexableCodingKey.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import Foundation

struct IndexableCodingKey: CodingKey {
    init(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int?
    var stringValue: String

    init(intValue: Int) {
        self.stringValue = "\(intValue)"
    }

    init(key: String, index: UInt) {
        self.stringValue = "\(key)\(index)"
    }
}
