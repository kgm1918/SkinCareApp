//
//  RoutineBuilder.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import SwiftUI

struct RoutineBuilder {
    static func build(from profile: UserProfile) -> [RoutineStep] {
        var steps: [RoutineStep] = []

        steps.append(.init(imageName: "drop", title: "Cleanser", stepDescription: "Gentle foam cleanser", time: "1 min", period: "morning"))
        steps.append(.init(imageName: "drop", title: "Moisturizer", stepDescription: "Lightweight day cream for hydration", time: "1 min", period: "morning"))
        steps.append(.init(imageName: "sunProduct", title: "Sunscreen", stepDescription: "SPF 50+ broad spectrum protection", time: "1 min", period: "morning"))

        steps.append(.init(imageName: "drop", title: "Cleanser", stepDescription: "Deep cleansing oil to remove makeup and SPF", time: "2 min", period: "evening"))
        steps.append(.init(imageName: "moonProduct", title: "Moisturizer", stepDescription: "Rich night cream for repair", time: "1 min", period: "evening"))

        if profile.concerns.contains("💢 Acne") {
            steps.append(.init(imageName: "sparkles", title: "Treatment", stepDescription: "Vitamin C serum for brightening", time: "1 min", period: "evening"))
        }

        if profile.skinType == "Oily" {
            steps.append(.init(imageName:"sparkles", title: "Toner", stepDescription: "Hydrating toner to balance pH", time:"30 sec", period: "morning"))
        }

        return steps
    }
}
