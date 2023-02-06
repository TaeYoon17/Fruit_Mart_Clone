//
//  QuantitySelector.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/27.
//

import SwiftUI
struct QuantitySelector: View {
    @Binding var quantity:Int
    var range: ClosedRange<Int> = 1...20
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    var body: some View {
        HStack{
            Button{
                changeQuantity(-1)
            }label: {
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            Text("\(quantity)").bold().font(Font.system(.title,design: .monospaced))
            Button{
                self.changeQuantity(1)
            }label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }.foregroundColor(Color.gray.opacity(0.5))
        }
    }
    private func changeQuantity(_ num:Int){
        if range ~= self.quantity + num{
            quantity += num
            softFeedback.prepare()
            softFeedback.impactOccurred(intensity: 0.8)
        }else{
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred()
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    // 바인딩 된 컴포넌트의 변화를 프리뷰에서 적용하기
    @State private var quantity = 0
    static var previews: some View {//static 함수로 프로퍼티 적용 불가
        Group{
            QuantitySelector(quantity: .constant(1))
            QuantitySelector(quantity: .constant(2))
        }.previewLayout(.sizeThatFits)
    }
}
