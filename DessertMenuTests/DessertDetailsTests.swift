//
//  DessertDetailsTests.swift
//  DessertMenuTests
//
//  Created by Philip Loden on 8/21/24.
//

import XCTest
@testable import DessertMenu

final class DessertDetailsTests: XCTestCase {

    func testDecode() throws {
        let jsonString = #"{"meals":[{"idMeal":"53049","strMeal":"Apam balik","strDrinkAlternate":null,"strCategory":"Dessert","strArea":"Malaysian","strInstructions":"Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/adxcbq1619787919.jpg","strTags":null,"strYoutube":"https:\/\/www.youtube.com\/watch?v=6R8ffRRJcrg","strIngredient1":"Milk","strIngredient2":"Oil","strIngredient3":"Eggs","strIngredient4":"Flour","strIngredient5":"Baking Powder","strIngredient6":"Salt","strIngredient7":"Unsalted Butter","strIngredient8":"Sugar","strIngredient9":"Peanut Butter","strIngredient10":"","strIngredient11":"","strIngredient12":"","strIngredient13":"","strIngredient14":"","strIngredient15":"","strIngredient16":"","strIngredient17":"","strIngredient18":"","strIngredient19":"","strIngredient20":"","strMeasure1":"200ml","strMeasure2":"60ml","strMeasure3":"2","strMeasure4":"1600g","strMeasure5":"3 tsp","strMeasure6":"1\/2 tsp","strMeasure7":"25g","strMeasure8":"45g","strMeasure9":"3 tbs","strMeasure10":" ","strMeasure11":" ","strMeasure12":" ","strMeasure13":" ","strMeasure14":" ","strMeasure15":" ","strMeasure16":" ","strMeasure17":" ","strMeasure18":" ","strMeasure19":" ","strMeasure20":" ","strSource":"https:\/\/www.nyonyacooking.com\/recipes\/apam-balik~SJ5WuvsDf9WQ","strImageSource":null,"strCreativeCommonsConfirmed":null,"dateModified":null}]}"#

        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let json = try? decoder.decode(DessertDetailsContainer.self, from: jsonString.data(using: .utf8)!)
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.meals.first?.name, "Apam balik")
        XCTAssertEqual(json?.meals.first?.instructions, "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.")
    }

}
