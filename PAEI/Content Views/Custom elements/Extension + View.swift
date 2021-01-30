//
//  Extension + View.swift
//  PAEI
//
//  Created by Сергей on 30.01.2021.
//

import SwiftUI

extension View {
    var isSmallScreen: Bool {
        UIScreen.main.bounds.size.height < 570
    }
}




extension ViewModifier {
    var isSmallScreen: Bool {
        //        print("Высота экрана \(UIScreen.main.bounds.size.height)")
        UIScreen.main.bounds.size.height < 570
    }
}
