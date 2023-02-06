//
//  Symbol.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/02/06.
//

import SwiftUI

struct Symbol: View {
    let systemName:String
    let imageScale: Image.Scale
    let color: Color?
    init(_ systemName:String,scale imageScale: Image.Scale = .medium,
         color: Color? = nil){
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    var body: some View {
        Image(systemName: self.systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}

struct Symbol_Previews: PreviewProvider {
    static var previews: some View {
        Symbol("heart",scale: .medium,color: .red)
    }
}
