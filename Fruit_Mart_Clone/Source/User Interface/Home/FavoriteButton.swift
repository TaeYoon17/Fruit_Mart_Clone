//
//  FavoriteButton.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/27.
//

import SwiftUI

struct FavoriteButton: View {
    let product: Product
    @EnvironmentObject private var store: Store
    private var imageName: String{
        product.isFavorite ? "heart.fill" : "heart"
    }
    var body: some View {
        Button{
            self.store.toggleFavorite(of: self.product)
        }label: {
//            Image(systemName: imageName)
//                .imageScale(.large)
//                .foregroundColor(.peach)
//                .frame(width: 32,height:32)
            Symbol(imageName,scale: .large,color: .peach)
                .frame(width: 32,height: 32)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static let store = Store()
    static var previews: some View {
        FavoriteButton(product: store.products[0])
            .environmentObject(store)
    }
}
