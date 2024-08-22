//
//  ContentView.swift
//  DessertMenu
//
//  Created by Philip Loden on 8/21/24.
//

import SwiftUI

struct ContentView: View {
    @State var desserts: [Dessert] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(self.desserts, id: \.self) { dessert in
                    NavigationLink(destination: DessertDetailView(dessert: dessert)) {
                        HStack {
                            AsyncImage(url: URL(string: dessert.thumbUrl)) { imagePhase in
                                if let image = imagePhase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                }
                            }
                            Text(dessert.name)
                        }
                    }
                }
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {
        let unsorted = await APIController.loadDesserts() ?? []
        let sorted = unsorted.sorted(using: KeyPathComparator(\.name, order: .forward))
        self.desserts = sorted
    }
}

#Preview {
    ContentView(desserts: [Dessert(name: "Pie", thumbUrl: #"https:\/\/www.themealdb.com\/images\/media\/meals\/adxcbq1619787919.jpg"#, mealID: "")!])
}
