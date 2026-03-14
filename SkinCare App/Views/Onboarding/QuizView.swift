//
//  QuizView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 12.03.2026.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel = SkinQuizViewModel()

    var body: some View {
        NavigationStack{
            VStack(spacing: 24) {
                QuizHeaderView(
                    questionText: viewModel.questionText,
                    progress: viewModel.progress,
                    onBack: {
                        viewModel.goBack()
                    }
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.title)
                        .inter(font:.semibold, size:24)
                    
                    if let subtitle = viewModel.subtitle {
                        Text(subtitle)
                            .foregroundStyle(.secondary)
                            .inter(font: .regular, size: 14)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Group {
                    switch viewModel.currentStep {
                    case .skinType:
                        SkinTypeStepView(viewModel: viewModel)
                        
                    case .concerns:
                        SkinConcernStepView(viewModel: viewModel)
                        
                    case .routine:
                        SkinRoutineStepView(viewModel: viewModel)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.continueTapped()
                }) {
                    Text(viewModel.buttonTitle)
                        .inter(font: .semibold, size: 16)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                    
                }
                .foregroundColor(viewModel.isContinueEnabled ? .black : .appGrey)
                .background(viewModel.isContinueEnabled ? .coral : .appGrey.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .disabled(!viewModel.isContinueEnabled)
                
                
            }
            .padding(20)
            .navigationDestination(isPresented: $viewModel.shouldShowRoutine) {
                           if let profile = viewModel.generatedProfile {
                               RoutineView(profile: profile, steps: viewModel.generatedSteps)
                           }
                       }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuizView()
}
