//
//  View.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 10.03.2026.
//

import SwiftUI

extension View {
    func inter(font: Inter = .regular, size: CGFloat = 14) -> some View{
        self
            .font(.custom(font.rawValue, size: size))
    }
}
