//
//  ButtonStyle.swift
//  PAEI
//
//  Created by Сергей on 08.01.2021.
//

import SwiftUI
//
//struct BlueStyleButton: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//            configuration.label
//                .foregroundColor(.white)
//                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
////                .padding()
//                .background( Color.blue)
//
//
//                .cornerRadius(15.0)
//        }
//}
//
//struct ButtonStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//            Text("Button")
//        }) .buttonStyle(BlueStyleButton() )
//    }
//}




struct CustomStyleButton: ViewModifier {
    let disabledStyle: Bool
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 50)
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(disabledStyle ? backgroundColor.opacity(0.4) : backgroundColor)
            .cornerRadius(10)
    }
}

extension View {
    func setBlueStyleButton(disabledStyle: Bool = false, color: Color = .blue) -> some View {
        self.modifier(
            CustomStyleButton(disabledStyle: disabledStyle, backgroundColor: color)
        )
    }
}

struct BlueStyleButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Button")
                .setBlueStyleButton()
        })
        . padding()
    }
}
