//
//  ScreenManager.swift
//  PAEI
//
//  Created by Сергей on 09.01.2021.
//

import SwiftUI

class ScreenManager: ObservableObject {
    @Published var isModalPresentPassingTest: Bool = false
    @Published var isModalPresentResultView: Bool = false
}
