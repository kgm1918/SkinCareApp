//
//  QuizHeaderView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 14.03.2026.
//

import SwiftUI

struct QuizHeaderView: View {
    let questionText: String
    let progress: Double
    let onBack: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                Button(action: onBack) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.black)
                        .background(
                            Circle()
                                .stroke(.appGrey, lineWidth: 0.2)
                            )
                }

                Text(questionText)
                    .inter(font: .regular, size: 12)
                    .foregroundStyle(.appGrey)

                Spacer()
            }

            ProgressView(value: progress)
                .tint(.coral)
        }
    }
}
