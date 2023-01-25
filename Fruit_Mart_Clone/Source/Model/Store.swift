//
//  ㄴ색ㄷ.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/21.
//

import Foundation
final class Store{
    var products:[Product]
    init(filename: String = "ProductData.json"){
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
