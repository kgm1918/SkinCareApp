//
//  UserProfile.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import Foundation
import SwiftData

@Model
final class UserProfile {
    var skinType: String
    var concerns: [String]
    var currentRoutine: String

    init(
        skinType: String,
        concerns: [String],
        currentRoutine: String
    ) {
        self.skinType = skinType
        self.concerns = concerns
        self.currentRoutine = currentRoutine
    }
}
