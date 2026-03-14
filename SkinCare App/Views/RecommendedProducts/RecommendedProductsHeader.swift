//
//  RecommendedProductsHeader.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 14.03.2026.
//

import SwiftUI

struct RecommendedProductsHeader : View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(){
            HStack(){
                Button{
                   dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                         .frame(width: 20, height: 20)
                         .padding(10)
                         .background(Circle().stroke(Color(.appGrey)))
                         .foregroundStyle(.black)
                }
               
                Spacer()
                Text("Recommended Products")
                    .inter(font: .semibold, size:20)
                   
                Spacer()
                Image("funnel")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20, height:20)
                    .padding(10)
                    .background(Circle().stroke(Color(.appGrey)))
            }
            .padding(.horizontal, 24)
            Text("Curated for your skin type")
                .inter(font: .regular, size:14)
                .foregroundStyle(.appGrey)
            Divider()
        }
       
    }
}
