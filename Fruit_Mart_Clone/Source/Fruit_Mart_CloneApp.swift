//
//  Fruit_Mart_CloneApp.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2022/12/22.
//

import SwiftUI

@main
struct Fruit_Mart_CloneApp: App {
    var body: some Scene {
        WindowGroup {
            Home().environmentObject(Store())
        }
    }
}
