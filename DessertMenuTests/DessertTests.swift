//
//  DessertTests.swift
//  DessertMenuTests
//
//  Created by Philip Loden on 8/21/24.
//

import XCTest
@testable import DessertMenu

final class DessertTests: XCTestCase {

    func testDecode() throws {
        let jsonString = #"{"meals":[{"strMeal":"Apam balik","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/adxcbq1619787919.jpg","idMeal":"53049"}]}"#
        let decoder = JSONDecoder()
        let json = try? decoder.decode(DessertContainer.self, from: jsonString.data(using: .utf8)!)
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.meals.first?.name, "Apam balik")
    }

}
