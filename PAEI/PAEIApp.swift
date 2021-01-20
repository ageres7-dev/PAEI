//
//  PAEIApp.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

@main
struct PAEIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ScreenManager())
        }
    }
}
