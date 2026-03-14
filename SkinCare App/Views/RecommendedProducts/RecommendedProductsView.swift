//
//  RecommendedProductsView.swift
//  SkinCare App
//
//  Created by Gulnaz Kaztayeva on 14.03.2026.
//

import SwiftUI

struct RecommendedProductsView : View {
    let products = ProductLoader.load()
    var body: some View {
        VStack(){
            RecommendedProductsHeader()
            
             List(products) { product in
                 HStack(alignment: .top){
                     Image(product.imageName)
                         .resizable()
                         .scaledToFit()
                         .frame(width: 80, height: 80)
                     VStack(alignment: .leading, spacing: 4) {
                         Text(product.category)
                             .inter(font:.regular, size:12)
                             .foregroundStyle(.coral)
                             .padding(.horizontal, 7)
                             .padding(.vertical, 4)
                             .background(.coral.opacity(0.1))
                             .clipShape(RoundedRectangle(cornerRadius: 14))
                         Text(product.name)
                             .inter(font:.semibold, size:18)
                         Text(product.description)
                             .inter(font:.regular, size:14)
                             .foregroundStyle(.appGrey)
                         HStack(spacing: 4){
                             Image("ratingStar")
                                 .resizable()
                                 .scaledToFit()
                                 .frame(width:16, height:16)
                             Text(product.rating)
                                 .inter(font: .semibold, size:14)
                             Text("("+product.noOfRaters+")")
                                 .inter(font: .regular, size:12)
                                 .foregroundStyle(.appGrey)
                             Spacer()
                             Text("$" + product.price)
                                 .inter(font: .semibold, size:14)
                         }
                     }
                     
                 }
                 .padding(.vertical, 16)
             }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RecommendedProductsView()
}
