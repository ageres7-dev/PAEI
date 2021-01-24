//
//  TextBlock.swift
//  PAEI
//
//  Created by Сергей on 14.01.2021.
//

import SwiftUI

struct CustomBackgroung: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(colorScheme == .dark ? .customGray : .white)
            //                .shadow(color: shadowColor.opacity(0.5), radius: 25, x: 0, y: 0)
            content
                .padding()
        }
//        .shadow(radius: 25) 
    }
    
//    private var shadowColor: Color {
//        colorScheme == .dark ? .blue : .gray
//    }
}


extension View {
    func setCustomBackgroung() -> some View {
        self.modifier(
            CustomBackgroung()
        )
    }
}
