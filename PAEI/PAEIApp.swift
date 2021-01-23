//
//  PAEIApp.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

@main
struct PAEIApp: App {
    let condition = DataManager.shared.loadCondition()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ScreenManager())
                .environmentObject(СonditionManager(condition: condition))
        }
    }
}
