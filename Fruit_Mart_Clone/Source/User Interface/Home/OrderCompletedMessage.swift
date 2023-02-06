//
//  OrderCompletedMessage.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/02/06.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료!")
            .font(.system(size:24))
            .bold()
            .kerning(2)
    }
}

struct OrderCompletedMessage_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletedMessage()
    }
}
