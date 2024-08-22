//
//  APIController.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import Foundation

class APIController {

    static func loadDesserts() async -> [Dessert]? {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

        guard let url = URL(string: urlString) else { return nil }

        let session = URLSession.shared
        session.dataTask(with: url)

        typealias DataResponse = (Data, URLResponse)?

        let jsonDataResponse: DataResponse = try? await session.data(from: url)

        guard let data = jsonDataResponse?.0 else { return nil }

        let decoder = JSONDecoder()

        if let container = try? decoder.decode(DessertContainer.self, from: data) {
            return container.meals
        }

        return nil
    }

    static func loadDessertDetails(dessertID: String) async -> DessertDetails? {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessertID)"

        guard let url = URL(string: urlString) else { return nil }

        let session = URLSession.shared
        session.dataTask(with: url)

        typealias DataResponse = (Data, URLResponse)?

        let jsonDataResponse: DataResponse = try? await session.data(from: url)

        guard let data = jsonDataResponse?.0 else { return nil }

        let decoder = JSONDecoder()

        if let container = try? decoder.decode(DessertDetailsContainer.self, from: data) {
            return container.meals.first
        }

        return nil
    }
}
