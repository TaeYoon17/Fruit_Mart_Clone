//
//  ResizableImage.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/02/06.
//

import SwiftUI

struct ResizableImage: View {
    let name: String
    let contentMode: ContentMode
    let renderingMode: Image.TemplateRenderingMode?
    init(_ name: String,contentMode: ContentMode = .fill,
         renderingMode: Image.TemplateRenderingMode? = nil) {
        self.name = name
        self.contentMode = contentMode
        self.renderingMode = renderingMode
    }
    var body: some View {
        Image(name)
            .renderingMode(self.renderingMode)
            .resizable()
            .aspectRatio(contentMode: self.contentMode)
    }
}

struct ResizableImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizableImage("recipe03",contentMode: .fit)
    }
}
