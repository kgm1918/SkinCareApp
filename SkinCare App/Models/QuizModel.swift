//
//  QuizModel.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 12.03.2026.
//

import Foundation

enum QuizStep: Int, CaseIterable {
    case skinType = 0
    case concerns = 1
    case routine = 2

    var title: String {
        switch self {
        case .skinType:
            return "What is your skin type?"
        case .concerns:
            return "What are your main skin concerns?"
        case .routine:
            return "Current skincare routine?"
        }
    }

    var subtitle: String? {
        switch self {
        case .skinType:
            return nil
        case .concerns:
            return "Select all that apply"
        case .routine:
            return nil
        }
    }

    var questionText: String {
        "Question \(rawValue + 1) of \(QuizStep.allCases.count)"
    }

    var progress: Double {
        Double(rawValue + 1) / Double(QuizStep.allCases.count)
    }
}

enum SkinType: String, CaseIterable, Identifiable {
    case oily = "Oily"
    case dry = "Dry"
    case combination = "Combination"
    case normal = "Normal"
    case sensitive = "Sensitive"

    var id: String { rawValue }

    var description: String {
        switch self {
        case .oily:
            return "Shiny, large pores"
        case .dry:
            return "Tight, flaky"
        case .combination:
            return "Oily T-zone, dry cheeks"
        case .normal:
            return "Balanced, clear"
        case .sensitive:
            return "Easily irritated"
        }
    }
}

enum SkinConcern: String, CaseIterable, Identifiable {
    case acne = "💢 Acne"
    case dryness = "🏜️ Dryness"
    case redness = "🔴 Redness"
    case darkSpots = "⚫ Dark Spots"
    case aging = "⏰ Aging"
    case largePores = "🔍 Large Pores"

    var id: String { rawValue }

    var subtitle: String? { nil }
}

enum CurrentRoutine: String, CaseIterable, Identifiable {
    case none = "No routine"
    case basic = "Basic routine"
    case moderate = "Moderate routine"
    case extensive = "Extensive routine"

    var id: String { rawValue }

    var description: String {
        switch self {
        case .none:
            return "Just getting started"
        case .basic:
            return "Cleanser + moisturizer"
        case .moderate:
            return "3–5 products"
        case .extensive:
            return "6+ products"
        }
    }
}
