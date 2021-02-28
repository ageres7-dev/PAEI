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
    
    var isBigScreen: Bool {
        UIScreen.main.bounds.size.height > 667
    }
    var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
}




extension ViewModifier {
    var isSmallScreen: Bool {
//                print("Высота экрана \(UIScreen.main.bounds.size.height)")
//        return
            UIScreen.main.bounds.size.height < 570
    }
    var isBigScreen: Bool {
        UIScreen.main.bounds.size.height > 667
    }
    var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
}
