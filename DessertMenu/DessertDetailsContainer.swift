//
//  DessertDetailsContainer.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import Foundation

struct DessertDetailsContainer {
    let meals: [DessertDetails]

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

extension DessertDetailsContainer: Decodable {}
