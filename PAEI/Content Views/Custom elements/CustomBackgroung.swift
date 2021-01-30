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
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20.0)
//                .foregroundColor(Color(.systemGray6))
                .foregroundColor(colorScheme == .dark ? Color(.systemGray5) : .white)
            
            content
                .padding()
        }
    }
}


extension View {
    func setCustomBackgroung() -> some View {
        self.modifier(
            CustomBackgroung()
        )
    }
}
