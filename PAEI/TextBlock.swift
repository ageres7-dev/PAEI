//
//  TextBlock.swift
//  PAEI
//
//  Created by Сергей on 14.01.2021.
//

import SwiftUI

struct TextBlock2: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .padding()
            
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(colorScheme == .dark ? .customGray : .white)
            //                .shadow(color: shadowColor.opacity(0.5), radius: 25, x: 0, y: 0)
            
            
        }
    }
    
    private var shadowColor: Color {
        colorScheme == .dark ? .blue : .gray
    }
}


extension View {
    func setCustomBackgroung() -> some View {
        self.modifier(
            TextBlock2()
        )
    }
}



struct TextBlock2_Previews: PreviewProvider {
    static var previews: some View {
        TextBlock(text: "hinkjnkn")
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
}
