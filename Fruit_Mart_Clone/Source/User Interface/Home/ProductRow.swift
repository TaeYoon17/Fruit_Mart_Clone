//
//  ProductRow.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2022/12/22.
//

import SwiftUI
struct ProductRow: View {
    let product: Product
    var body: some View {
        HStack{
            productImage
            productDescriptor
        }.frame(height:150)
            .background(Color.primary.colorInvert())
            .cornerRadius(6)
            .shadow(color: Color.primary.opacity(0.33), radius: 1,x:2,y:2)
            .padding(.vertical, 8)
    }
    var productImage: some View{
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    var productDescriptor: some View {
        VStack(alignment: .leading){
            Text(product.name)
                .font(.headline).fontWeight(.medium).padding(.bottom,6)
            Text(product.description).font(.footnote).foregroundColor(.secondary)
            Spacer()
            self.viewFooter
        }.padding([.leading,.bottom],12).padding([.top,.trailing])
    }
    var viewFooter: some View {
        HStack(spacing: 0){
            Text("$").font(.footnote)+Text(String(product.price)).font(.headline)
            Spacer()
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color("peach"))
                .frame(width: 32,height: 32)
            Image(systemName: "cart")
                .imageScale(.large)
                .foregroundColor(Color("peach"))
                .frame(width: 32,height: 32)
        }
    }
}
struct ProductRow_Previews: PreviewProvider {
  static var previews: some View {
      ProductRow(product: productSamples[0])
  }
}
