//
//  SkinCare_AppApp.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 09.03.2026.
//

import SwiftUI
import SwiftData

@main
struct SkinCare_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
                   UserProfile.self,
                   RoutineStep.self,
                   FavoriteProduct.self
               ])
    }
}
