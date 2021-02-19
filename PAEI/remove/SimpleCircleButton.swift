//
//  RadioButtonView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//
/*
import SwiftUI

struct SimpleCircleButton: View {
    
    let isMarked: Bool
    let isOn: Bool
    var action: () -> Void

    
    var detailedCharacteristic: some View {
//        GeometryReader { geometry in
//            let size = min(geometry.size.height, geometry.size.width)
            
            Button(action:  action ) {
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
                    .foregroundColor(.primary)
//                    .shadow(radius: size * 0.1)
//                    .padding()
            }
            .disabled(!isOn)
//            .frame(width: 50, height: 50)
        
//        }
        
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCircleButton(isMarked: true, isOn: true, action: {})
            .preferredColorScheme(.dark)
    }
}
*/
