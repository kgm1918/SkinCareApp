//
//  RoutineStep.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import Foundation
import SwiftData

@Model
final class RoutineStep {
    var imageName: String
    var title: String
    var stepDescription: String
    var time: String
    var period: String   // "morning" or "evening"
    var isCompleted: Bool

    init(
        imageName: String,
        title: String,
        stepDescription: String,
        time: String,
        period: String,
        isCompleted: Bool = false
    ) {
        self.imageName = imageName
        self.title = title
        self.stepDescription = stepDescription
        self.time = time
        self.period = period
        self.isCompleted = isCompleted
    }
}
