//
//  ProductLoader.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import Foundation

final class ProductLoader {
    static func load() -> [Product] {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
            print("products.json not found")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let products = try JSONDecoder().decode([Product].self, from: data)
            print("Loaded products count: \(products.count)")
            return products
        } catch {
            print("Failed to load products: \(error)")
            return []
        }
    }
}
