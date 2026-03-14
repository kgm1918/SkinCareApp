//
//  OnboardingView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 10.03.2026.
//

import SwiftUI

struct OnboardingView: View {
    var body : some View {
        VStack{
        HStack(spacing: 12) {
            Image("sparkles")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(10)
                .background(.coral.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 26))
            
            Text("SkinCare Guide")
                .inter(font: .semibold, size: 20)
                .foregroundStyle(.appText)
        }
        .padding(.top, 40)
        
        Image("mainImage")
            .resizable()
            .scaledToFit()
            .frame(width: 320, height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.top, 40)
        VStack(spacing: 16){
            Text("Find the perfect skincare routine for your skin")
                .inter(font: .semibold, size: 30)
                .foregroundColor(.appText)
                .multilineTextAlignment(.center)
            Text("Get personalized recommendations based on your unique skin type and concerns")
                .inter(font: .regular, size: 15)
                .foregroundStyle(.appGrey)
                .multilineTextAlignment(.center)
            PinkButton()
        }
        .padding(.top, 24)
        .padding(.horizontal, 25)
        Text("Takes less than 2 minutes")
                .inter(font: .regular, size: 12)
                .foregroundStyle(.appGrey)
                .padding(.top, 10)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    OnboardingView()
}

struct PinkButton : View {
    @State private var goNext = false
    var body: some View {
        Button{
            goNext = true
        } label: {
            Text("Start Skin Analysis")
                .inter(font:.semibold, size:16)
                .foregroundStyle(.appText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(.coral)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .navigationDestination(isPresented: $goNext){
            QuizView()
        }
    }
}
