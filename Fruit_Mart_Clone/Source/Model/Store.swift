//
//  ㄴ색ㄷ.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/21.
//

import Foundation
// 싱글톤 class 앱 전체 매니저
final class Store:ObservableObject{
    @Published var products:[Product]
    @Published var orders:[Order] = []
    init(filename: String = "ProductData.json"){
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
    
    func placeOrder(product: Product,quantity: Int){
        let nextID = Order.orderSequence.next()!
        let order = Order(id: nextID, product: product, quantity: quantity)
        orders.append(order)
        print(order)
    }
}

extension Store{
    func toggleFavorite(of product: Product){
        guard let index:Int = self.products.firstIndex(of: product) else{
            return
        }
        print("is toggled")
        products[index].isFavorite.toggle()
    }
}
