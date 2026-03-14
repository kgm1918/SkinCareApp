//
//  SkinTypeStepView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 12.03.2026.
//

import SwiftUI


struct SkinTypeStepView: View {
    @ObservedObject var viewModel: SkinQuizViewModel

    var body: some View {
        VStack(spacing: 12) {
            ForEach(SkinType.allCases) { type in
                QuizOptionCard(
                    title: type.rawValue,
                    subtitle: type.description,
                    isSelected: viewModel.selectedSkinType == type
                ) {
                    viewModel.selectSkinType(type)
                }
            }
        }
    }
}


struct QuizOptionCard: View {
    let title: String
    let subtitle: String?
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .foregroundStyle(.primary)
                        .inter(font: .semibold, size: 16)

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .inter(font: .medium, size: 14)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.coral)
                }
            }
            .padding(22)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? Color.coral : Color.gray.opacity(0.15), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
