//
//  ProductDetailView.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/21.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    var body: some View {
        Color.white.ignoresSafeArea(.all)
            .overlay (
                VStack(spacing:0){
                    self.productImage
                    self.orderView
                }.edgesIgnoringSafeArea(.top)
                    .background(.white)
            )

    }
    var productImage: some View{
        GeometryReader{ _ in
            Image(self.product.imageName).resizable()
                .scaledToFill()
        }
    }
    var orderView: some View{
        GeometryReader{
            VStack(alignment: .leading){
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            .padding(.top,32)
            .frame(height: $0.size.height + 10)
            .padding([.horizontal],32)
            .background(Color.white) // 아이폰 테마 무시한다.
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10,x: 0,y: -5)
            .mask(Rectangle().padding(.top, -20))
            //bottom에도 Shadow 효과가 나타나는 것을 방지한다.
            
        }
    }
    var productDescription:some View{
        VStack(alignment: .leading,spacing: 16) {
            HStack{
                Text(product.name).font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                Spacer()
                Button{
                    print("즐겨찾기 추가")
                }label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundColor(Color.peach)
                        .frame(width: 32,height: 32)
                }
            }
            Text(split(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    var priceInfo: some View{
        (Text("$ ")+Text("\(self.product.price)").font(.largeTitle))
            .fontWeight(.medium)
            .foregroundColor(.black)
        //Spacer()
    }
    var placeOrderButton: some View{
        Button{
            print("order btn")
        }label: {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity,minHeight: 30,maxHeight: 55)
                .overlay(
                    Text("주문하기")
                        .foregroundColor(.white)
                        .font(.system(size:20))
                        .fontWeight(.medium)
                )
        }.padding(.bottom,8)
            .background(.white)
    }
}
extension ProductDetailView{
    func split(_ text:String)->String{
        guard !text.isEmpty else{ return text }
        let centerIdx:String.Index = text.index(text.startIndex,offsetBy: text.count / 2);
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ") ??
        text[centerIdx...].firstIndex(of: " ") ?? text.index(before: text.endIndex)
        let leftString = text[..<centerSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rightString = text[centerSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(leftString + "\n" + rightString)
    }
}
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: ProductDetailView(product: productSamples[0]))
    }
}
