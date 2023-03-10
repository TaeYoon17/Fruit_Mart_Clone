//
//  ContentView.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2022/12/22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var store: Store
    var body: some View {
        //        VStack {
        //            Image("apple").resizable()
        //                .scaledToFill()
        //                .frame(width: 140)
        //                .clipped()
        //        }
        //        .padding()
        //        VStack {
        //            ProductView(product: productSamples[0])
        //            ProductView(product: productSamples[1])
        //            ProductView(product: productSamples[2])
        //        }
        NavigationView {
            List(store.products){product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductRow(product: product)
                }
            }
            .navigationTitle("과일마트")
        }
    }
}
/// onTapGesture는 컨트롤보다 우선순위를 갖는다.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(Store())
    }
}

