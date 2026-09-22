//
//  SkinQuizViewModelTests.swift
//  SkinCare AppTests
//
//  Created by Gulnaz Kaztayeva on 11.09.2026.
//

import Testing
@testable import SkinCare_App

private func makeSUT() -> SkinQuizViewModel {
    SkinQuizViewModel()
}

private func makeSUTOnConcernsStep() -> SkinQuizViewModel {
    let sut = makeSUT()
    sut.selectSkinType(.oily)
    sut.continueTapped()
    return sut
}

private func makeSUTOnRoutineStep() -> SkinQuizViewModel {
    let sut = makeSUTOnConcernsStep()
    sut.toggleConcern(.acne)
    sut.continueTapped()
    return sut
}

private func makeCompletedSUT() -> SkinQuizViewModel {
    let sut = makeSUTOnRoutineStep()
    sut.selectRoutine(.basic)
    return sut
}

@Suite("SkinQuizViewModel")
struct SkinQuizViewModelTests {

    @Suite("Initial state")
    struct InitialState {

        @Test("Starts on the skin type step with no answers")
        func startsEmpty() {
            let sut = makeSUT()

            #expect(sut.currentStep == .skinType)
            #expect(sut.selectedSkinType == nil)
            #expect(sut.selectedConcerns.isEmpty)
            #expect(sut.selectedRoutine == nil)
        }

        @Test("Produces no routine before the quiz is finished")
        func producesNothingUpFront() {
            let sut = makeSUT()

            #expect(sut.generatedProfile == nil)
            #expect(sut.generatedSteps.isEmpty)
            #expect(sut.shouldShowRoutine == false)
        }

        @Test("Continue is disabled until the first question is answered")
        func continueStartsDisabled() {
            let sut = makeSUT()

            #expect(sut.isContinueEnabled == false)
        }
    }

    @Suite("Answering")
    struct Answering {

        @Test("Any skin type can be selected", arguments: SkinType.allCases)
        func selectsSkinType(_ type: SkinType) {
            let sut = makeSUT()

            sut.selectSkinType(type)

            #expect(sut.selectedSkinType == type)
        }

        @Test("Skin type is a single choice: a second tap replaces the first")
        func skinTypeReplacesPrevious() {
            let sut = makeSUT()

            sut.selectSkinType(.oily)
            sut.selectSkinType(.dry)

            #expect(sut.selectedSkinType == .dry)
        }

        @Test("Concerns are multiple choice and accumulate")
        func concernsAccumulate() {
            let sut = makeSUTOnConcernsStep()

            sut.toggleConcern(.acne)
            sut.toggleConcern(.redness)

            #expect(sut.selectedConcerns == [.acne, .redness])
        }

        @Test("Tapping the same concern twice deselects it")
        func concernTogglesOff() {
            let sut = makeSUTOnConcernsStep()

            sut.toggleConcern(.acne)
            sut.toggleConcern(.acne)

            #expect(sut.selectedConcerns.isEmpty)
        }

        @Test("Current routine is a single choice")
        func routineReplacesPrevious() {
            let sut = makeSUTOnRoutineStep()

            sut.selectRoutine(.basic)
            sut.selectRoutine(.extensive)

            #expect(sut.selectedRoutine == .extensive)
        }
    }

    @Suite("Continue button")
    struct ContinueButton {

        @Test("Skin type step enables Continue once a type is picked")
        func enabledAfterSkinType() {
            let sut = makeSUT()
            #expect(sut.isContinueEnabled == false)

            sut.selectSkinType(.normal)

            #expect(sut.isContinueEnabled)
        }

        @Test("Concerns step needs at least one concern")
        func enabledAfterOneConcern() {
            let sut = makeSUTOnConcernsStep()
            #expect(sut.isContinueEnabled == false)

            sut.toggleConcern(.aging)

            #expect(sut.isContinueEnabled)
        }

        @Test("Deselecting the last concern disables Continue again")
        func disabledWhenConcernsCleared() {
            let sut = makeSUTOnConcernsStep()
            sut.toggleConcern(.aging)

            sut.toggleConcern(.aging)

            #expect(sut.isContinueEnabled == false)
        }

        @Test("Routine step needs a routine")
        func enabledAfterRoutine() {
            let sut = makeSUTOnRoutineStep()
            #expect(sut.isContinueEnabled == false)

            sut.selectRoutine(.none)

            #expect(sut.isContinueEnabled)
        }

        @Test("Title reads Continue everywhere but the last step")
        func buttonTitlePerStep() {
            let sut = makeSUT()
            #expect(sut.buttonTitle == "Continue")

            sut.selectSkinType(.dry)
            sut.continueTapped()
            #expect(sut.buttonTitle == "Continue")

            sut.toggleConcern(.dryness)
            sut.continueTapped()
            #expect(sut.buttonTitle == "Get My Routine")
        }
    }

    @Suite("Navigation")
    struct Navigation {

        @Test("Continue walks the steps in order")
        func movesForward() {
            let sut = makeSUT()

            sut.selectSkinType(.combination)
            sut.continueTapped()
            #expect(sut.currentStep == .concerns)

            sut.toggleConcern(.largePores)
            sut.continueTapped()
            #expect(sut.currentStep == .routine)
        }

        @Test("Continue is ignored while the step is unanswered")
        func blockedWhenDisabled() {
            let sut = makeSUT()

            sut.continueTapped()

            #expect(sut.currentStep == .skinType)
        }

        @Test("Back walks the steps in reverse")
        func movesBackward() {
            let sut = makeSUTOnRoutineStep()

            sut.goBack()
            #expect(sut.currentStep == .concerns)

            sut.goBack()
            #expect(sut.currentStep == .skinType)
        }

        @Test("Back on the first step does nothing")
        func backOnFirstStepIsNoOp() {
            let sut = makeSUT()

            sut.goBack()

            #expect(sut.currentStep == .skinType)
        }

        @Test("Going back keeps the answers already given")
        func backKeepsAnswers() {
            let sut = makeSUTOnRoutineStep()

            sut.goBack()
            sut.goBack()

            #expect(sut.selectedSkinType == .oily)
            #expect(sut.selectedConcerns == [.acne])
        }

        @Test(
            "Progress reflects the current step",
            arguments: zip(QuizStep.allCases, [1.0 / 3, 2.0 / 3, 1.0])
        )
        func progressPerStep(step: QuizStep, expected: Double) {
            #expect(step.progress == expected)
        }

        @Test("Question counter is one-based")
        func questionCounter() {
            let sut = makeSUT()

            #expect(sut.questionText == "Question 1 of 3")
        }
    }

    @Suite("Finishing the quiz")
    struct Finishing {

        @Test("Continue on the last step builds the profile from the answers")
        func buildsProfile() throws {
            let sut = makeCompletedSUT()
            sut.selectSkinType(.dry)
            sut.selectRoutine(.moderate)

            sut.continueTapped()

            let profile = try #require(sut.generatedProfile)
            #expect(profile.skinType == SkinType.dry.rawValue)
            #expect(profile.currentRoutine == CurrentRoutine.moderate.rawValue)
        }

        @Test("All selected concerns land in the profile")
        func carriesEveryConcern() throws {
            let sut = makeCompletedSUT()
            sut.toggleConcern(.redness)
            sut.toggleConcern(.darkSpots)

            sut.continueTapped()

            let profile = try #require(sut.generatedProfile)
            #expect(Set(profile.concerns) == [   // a Set, so order is not guaranteed
                SkinConcern.acne.rawValue,
                SkinConcern.redness.rawValue,
                SkinConcern.darkSpots.rawValue
            ])
        }

        @Test("Finishing produces a routine and opens the routine screen")
        func showsRoutine() {
            let sut = makeCompletedSUT()

            sut.continueTapped()

            #expect(sut.shouldShowRoutine)
            #expect(sut.generatedSteps.isEmpty == false)
        }

        @Test("The routine covers both morning and evening")
        func routineCoversBothPeriods() {
            let sut = makeCompletedSUT()

            sut.continueTapped()

            let periods = Set(sut.generatedSteps.map(\.period))
            #expect(periods == ["morning", "evening"])
        }

        @Test("Finishing early with missing answers is ignored")
        func ignoresIncompleteQuiz() {
            let sut = makeSUT()

            sut.finishQuiz()

            #expect(sut.generatedProfile == nil)
            #expect(sut.shouldShowRoutine == false)
        }
    }
}
