//
//  DessertDetailView.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import SwiftUI

struct DessertDetailView: View {
    @State var dessert: Dessert
    @State var details: DessertDetails?

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: dessert.thumbUrl)) { imagePhase in
                    if let image = imagePhase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                }
                Spacer(minLength: 20)
                Text(self.dessert.name)
                    .font(.title)
                Spacer(minLength: 20)
                Text(self.details?.instructions ?? "")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Spacer(minLength: 20)
                Text("Ingredients")
                    .font(.title)
                Spacer(minLength: 20)
                if let ingredients = self.details?.recipeIngredients {
                    ForEach(ingredients, id: \.self) { ingredient in
                        HStack {
                            Text(ingredient.ingredient)
                            Spacer()
                            Text(ingredient.measurement)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                     }
                }

            }
            .navigationTitle(dessert.name)
            .task {
                await loadData()
            }
        }
    }

    func loadData() async {
        let details = await APIController.loadDessertDetails(dessertID: self.dessert.mealID)
        self.details = details
    }
}

#Preview {
    DessertDetailView(dessert: Dessert(name: "Apple Pie", thumbUrl: #"https:\/\/www.themealdb.com\/images\/media\/meals\/adxcbq1619787919.jpg"#, mealID: "1")!)
}
