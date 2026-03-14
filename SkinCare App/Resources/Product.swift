//
//  Product.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import Foundation


struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let category: String
    let description: String
    let rating: String
    let noOfRaters: String
    let price: String
    let imageName: String
}
