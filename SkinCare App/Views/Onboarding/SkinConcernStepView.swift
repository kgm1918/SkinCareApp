//
//  SkinConcernStepView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 12.03.2026.
//

import SwiftUI

struct SkinConcernStepView : View {
    @ObservedObject var viewModel: SkinQuizViewModel
    var body: some View {
        VStack(spacing: 12) {
            ForEach(SkinConcern.allCases) { concern in
                QuizOptionCard(
                    title: concern.rawValue,
                    subtitle: concern.subtitle,
                    isSelected: viewModel.selectedConcerns.contains(concern)
                ) {
                    viewModel.toggleConcern(concern)
                }
            }
        }
    }
}

