//
//  DessertDetails.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import Foundation

struct DessertDetails {
    let name: String
    let thumbUrl: String
    let mealID: String
    let instructions: String
    let recipeIngredients: [RecipeIngredient]

    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbUrl = "strMealThumb"
        case mealID = "idMeal"
        case instructions = "strInstructions"
    }
}

extension DessertDetails: Hashable {}

extension DessertDetails: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let dynamicContainer = try decoder.container(keyedBy: IndexableCodingKey.self)

        var idx: UInt = 1
        var ingredients = [RecipeIngredient]()

        while true {
            guard
                let ingredient = try? dynamicContainer.decode(String.self, forKey: IndexableCodingKey(key: "strIngredient", index: idx)),
                let measure = try? dynamicContainer.decode(String.self, forKey: IndexableCodingKey(key: "strMeasure", index: idx))         else {
                break
            }

            if let recipeIngredient = RecipeIngredient(ingredient: ingredient, measurement: measure) {
                ingredients.append(recipeIngredient)
            }
            
            idx += 1
        }

        let name = try values.decode(String.self, forKey: .name)
        let thumb = try values.decode(String.self, forKey: .thumbUrl)
        let id = try values.decode(String.self, forKey: .mealID)
        let instructions = try values.decode(String.self, forKey: .instructions)
        self.init(name: name, thumbUrl: thumb, mealID: id, instructions: instructions, recipeIngredients: ingredients)
    }
}
