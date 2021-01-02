//
//  RadioButtonView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

struct CircleButton: View {
    
    @Binding var isMarked: Bool
    let isOn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.height, geometry.size.width)
            
            Button(action: { isMarked = true }) {
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
                    .foregroundColor(isMarked ? .blue : .primary)
                    .shadow(radius: size * 0.1)
//                    .padding()
            }
            .disabled(!isOn)
        }
    }
    
//    private var action: () {
//        if isOn { isMarked = true }
//    }
}


struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(isMarked: .constant(false), isOn: false)
            
            .preferredColorScheme(.dark)
    }
}
