//
//  ButtonStyle.swift
//  PAEI
//
//  Created by Сергей on 08.01.2021.
//

import SwiftUI

struct CustomStyleButton: ViewModifier {
    let disabledStyle: Bool
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
//            .foregroundColor(disabledStyle ? Color.white.opacity(0.8) : .white)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: isSmallScreen ? 44 : 50)
            .background(disabledStyle ? backgroundColor.opacity(0.4) : backgroundColor)
            .cornerRadius(10)
    }
}




extension View {
    func setCustomStyleButton(disabledStyle: Bool = false, color: Color = .blue) -> some View {
        self.modifier(
            CustomStyleButton(disabledStyle: disabledStyle, backgroundColor: color)
        )
    }
}

struct BlueStyleButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Button")
                .setCustomStyleButton()
        })
        . padding()
    }
}
