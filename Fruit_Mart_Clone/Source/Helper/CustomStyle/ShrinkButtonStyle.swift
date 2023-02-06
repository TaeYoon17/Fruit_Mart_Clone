//
//  ShrinkButtonStyle.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/02/06.
//

import SwiftUI

struct ShrinkButtonStyle: ButtonStyle{
    var minSclae: CGFloat = 0.9
    var minOpacity: Double = 0.6
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minSclae : 1)
            .opacity(configuration.isPressed ? minOpacity : 1)
    }
}

//extension Button{
//    func shrinkStyle()->some View{
//        self.buttonStyle(ShrinkButtonStyle())
//    }
//}
