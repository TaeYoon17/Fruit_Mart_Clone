//
//  ProductDetailView.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/21.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject private var store: Store
    let product: Product
    @State private var quantity = 1
    @State private var showingAlert = false
    @State private var showingPopup = false
    var body: some View {
        VStack(spacing:0){
            self.productImage
            self.orderView
        }
        .popup(isPresendted: $showingPopup,style: .dimmed, content: {
                OrderCompletedMessage()
            })
            .edgesIgnoringSafeArea(.top)
            .background(.white)
    }
    var productImage: some View{
        GeometryReader{ _ in
//            Image(self.product.imageName).resizable()
//                .scaledToFill()
            ResizableImage(self.product.imageName)
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
            .buttonStyle(PlainButtonStyle())
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
                FavoriteButton(product: product)
            }
            Text(split(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    var priceInfo: some View{
        let price = quantity * product.price
        return HStack{(Text("$ ")+Text("\(price)").font(.largeTitle))
            .fontWeight(.medium)
            .foregroundColor(.black)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }
        
    }
    var placeOrderButton: some View{
        Button{
            self.showingAlert = true
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
        }
        .buttonStyle(ShrinkButtonStyle())
        .padding(.bottom,8)
            .background(.white)
            .alert(isPresented: $showingAlert){
                confimAlert
            }
    }
    var confimAlert: Alert{
        Alert(title: Text("주문 확인"),
              message: Text("\(product.name)을(를) \(quantity)개 구매하겠습니까?"),
              primaryButton: .default(Text("확인"),action: placeOrder),
              secondaryButton: .cancel(Text("취소").foregroundColor(.red))
          )
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
    func placeOrder(){
        store.placeOrder(product: product, quantity: quantity)
        self.showingPopup = true
    }
}
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: ProductDetailView(product: productSamples[0]))
    }
}
