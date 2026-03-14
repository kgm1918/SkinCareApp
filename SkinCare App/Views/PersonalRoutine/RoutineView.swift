//
//  RoutineView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 13.03.2026.
//

import SwiftUI

struct RoutineView : View {
    let profile: UserProfile
    let steps: [RoutineStep]
    var body: some View {
        VStack(alignment:.leading){
            RoutineHeader()
            RoutineBody(profile: profile, steps: steps)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
    }
}

