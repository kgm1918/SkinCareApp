//
//  FavouriteProduct.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import Foundation
import SwiftData

@Model
final class FavoriteProduct {
    var productID: String

    init(productID: String) {
        self.productID = productID
    }
}
