//
//  RoutineHeader.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import SwiftUI

struct RoutineHeader : View {
    var body: some View {
        VStack(alignment:.leading, spacing: 7){
            HStack{
                Text("Your Routine")
                    .inter(font: .semibold, size: 24)
                Spacer()
                Image(systemName: "calendar")
                    .padding(9)
                    .background(Circle().fill(Color(.coral)))
            }
            Text("Personalized for your skin type")
                .inter(font: .regular, size: 16)
                .foregroundStyle(.appGrey)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        Divider()
    }
}
