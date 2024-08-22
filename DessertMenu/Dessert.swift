//
//  Dessert.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import Foundation

struct Dessert {
    let name: String
    let thumbUrl: String
    let mealID: String

    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbUrl = "strMealThumb"
        case mealID = "idMeal"
    }

    init?(name: String, thumbUrl: String, mealID: String) {
        guard
            name.isEmpty == false,
            mealID.isEmpty == false
        else {
            return nil
        }
        
        self.name = name
        self.thumbUrl = thumbUrl
        self.mealID = mealID
    }
}

extension Dessert: Hashable {}

extension Dessert: Decodable {}
