//
//  RecipeIngredient.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import Foundation

struct RecipeIngredient {
    let ingredient: String
    let measurement: String

    init?(ingredient: String, measurement: String) {
        guard
            ingredient.isEmpty == false,
            measurement.isEmpty == false
        else {
            return nil
        }
        
        self.ingredient = ingredient
        self.measurement = measurement
    }
}

extension RecipeIngredient: Hashable {}
