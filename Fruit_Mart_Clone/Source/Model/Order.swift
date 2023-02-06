//
//  Order.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/27.
//

import Foundation

struct Order : Identifiable{
    static var orderSequence = sequence(first: 1) { num in
        num+1
    }
    
    let id: Int
    let product: Product
    let quantity: Int
    
    var price: Int{
        product.price * quantity
    }
}
