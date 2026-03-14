//
//  RoutineBody.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 14.03.2026.
//

import SwiftUI

struct RoutineBody : View {
    @State private var goNext = false
    let profile: UserProfile
        let steps: [RoutineStep]

        var morningSteps: [RoutineStep] {
            steps.filter { $0.period == "morning" }
        }

        var eveningSteps: [RoutineStep] {
            steps.filter { $0.period == "evening" }
        }

    var body: some View {
        ScrollView{
            VStack(spacing: 32){
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Image("sun")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .padding(8)
                            .background(Circle().fill(Color(.sunYellow)))
                        Text("Morning Routine")
                            .inter(font: .semibold, size: 20)
                    }
                    VStack(spacing: 12){
                        ForEach(morningSteps) { step in
                            RoutineCard(step: step)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Image("moon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .padding(8)
                            .background(Circle().fill(Color(.lavender)))
                        Text("Evening Routine")
                            .inter(font: .semibold, size: 20)
                    }
                    VStack(spacing: 12){
                        ForEach(eveningSteps) { step in
                            RoutineCard(step: step)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 16){
                    VStack(alignment: .leading, spacing: 8){
                        Text("Need products?")
                            .inter(font: .semibold, size: 18)
                        Text("Browse our curated recommendations")
                            .inter(font: .regular, size: 14)
                            .foregroundStyle(.appGrey)
                    }
                    Button{
                        goNext = true
                    }label:{
                        HStack{
                            Image("shoppingBag")
                            Text("View Products")
                                .inter(font: .semibold, size: 16)
                                .foregroundStyle(.black)
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 80)
                    .background(.coral)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .navigationDestination(isPresented: $goNext) {
                                    RecommendedProductsView()
                                }
                }
                .padding(25)
                .background(.coral.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
        }
       
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

