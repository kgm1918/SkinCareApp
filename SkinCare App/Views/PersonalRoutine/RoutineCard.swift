//
//  RoutineCard.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 14.03.2026.
//

import SwiftUI


struct RoutineCard: View {
    let step: RoutineStep
    var body: some View {
        VStack(alignment:.leading){
            HStack(alignment:.top){
                Image(step.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(.coral).opacity(0.1)))
                VStack(alignment:.leading, spacing: 5){
                    Text(step.title)
                        .inter(font:.semibold, size: 18)
                    Text(step.stepDescription)
                        .inter(font:.regular, size: 14)
                        .foregroundStyle(.appGrey)
                }
                Spacer()
                Text(step.time)
                    .inter(font: .regular, size: 12)
                    .foregroundStyle(.appGrey)
            }
            .padding(17)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.appGrey, lineWidth: 0.5)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}
