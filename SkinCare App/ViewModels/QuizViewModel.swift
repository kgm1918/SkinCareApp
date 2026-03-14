//
//  QuizViewModel.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 12.03.2026.
//

import Foundation

final class SkinQuizViewModel: ObservableObject {
    @Published var currentStep: QuizStep = .skinType

    @Published var selectedSkinType: SkinType?
    @Published var selectedConcerns: Set<SkinConcern> = []
    @Published var selectedRoutine: CurrentRoutine?
    
    @Published var generatedProfile: UserProfile?
    @Published var generatedSteps: [RoutineStep] = []
    @Published var shouldShowRoutine = false

    var progress: Double {
        currentStep.progress
    }

    var questionText: String {
        currentStep.questionText
    }

    var title: String {
        currentStep.title
    }

    var subtitle: String? {
        currentStep.subtitle
    }

    var isContinueEnabled: Bool {
        switch currentStep {
        case .skinType:
            return selectedSkinType != nil
        case .concerns:
            return !selectedConcerns.isEmpty
        case .routine:
            return selectedRoutine != nil
        }
    }

    var buttonTitle: String {
        currentStep == .routine ? "Get My Routine" : "Continue"
    }

    func selectSkinType(_ type: SkinType) {
        selectedSkinType = type
    }

    func toggleConcern(_ concern: SkinConcern) {
        if selectedConcerns.contains(concern) {
            selectedConcerns.remove(concern)
        } else {
            selectedConcerns.insert(concern)
        }
    }

    func selectRoutine(_ routine: CurrentRoutine) {
        selectedRoutine = routine
    }

    func continueTapped() {
        guard isContinueEnabled else { return }

        switch currentStep {
        case .skinType:
            currentStep = .concerns
        case .concerns:
            currentStep = .routine
        case .routine:
            finishQuiz()
        }
    }

    func goBack() {
        switch currentStep {
        case .skinType:
            break
        case .concerns:
            currentStep = .skinType
        case .routine:
            currentStep = .concerns
        }
    }

    func finishQuiz() {
        guard let selectedSkinType else { return }
        guard let selectedRoutine else { return }

        let profile = UserProfile(
           skinType: selectedSkinType.rawValue,
           concerns: selectedConcerns.map(\.rawValue),
           currentRoutine: selectedRoutine.rawValue
        )

        let steps = RoutineBuilder.build(from: profile)

        generatedProfile = profile
        generatedSteps = steps
        shouldShowRoutine = true
    }
   
}
