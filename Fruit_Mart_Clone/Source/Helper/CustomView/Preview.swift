//
//  Preview.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/01/25.
//

import SwiftUI

struct Preview<V: View>: View {
    enum Device: String,CaseIterable{
        case iPhoneSE2 = "iPhone SE2"
        case iPhone14 = "iPhone 14"
        case iPhone14Pro = "iPhone 14 Pro"
        case iPhone14ProMax = "iPhone 14 Pro Max"
    }
    let source: V
    var devices: [Device] = [.iPhone14,.iPhone14Pro,.iPhone14ProMax]
    var displayDarkMode: Bool = true
    var body: some View {
        Group{
            ForEach(devices,id:\.self){
                self.previewSource(device: $0)
            }
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0])
                    .preferredColorScheme(.dark)
            }
        }
    }
    private func previewSource(device: Device)->some View{
        source.previewDevice(PreviewDevice(rawValue: device.rawValue))
            .previewDisplayName(device.rawValue)
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source:Text("뷰"))
    }
}
