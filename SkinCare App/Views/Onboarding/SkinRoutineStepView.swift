//
//  SkinRoutineStepView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 12.03.2026.
//

import SwiftUI


struct SkinRoutineStepView : View {
    @ObservedObject var viewModel: SkinQuizViewModel
    var body: some View {
        VStack(spacing: 12) {
            ForEach(CurrentRoutine.allCases) { routine in
                QuizOptionCard(
                    title: routine.rawValue,
                    subtitle: routine.description,
                    isSelected: viewModel.selectedRoutine == routine
                ) {
                    viewModel.selectRoutine(routine)
                }
            }
        }
    }
}

