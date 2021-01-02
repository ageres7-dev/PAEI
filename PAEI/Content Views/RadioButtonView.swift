//
//  RadioButtonView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

struct RadioButtonView: View {
    
    let isMarked: Bool
    var isOn: Bool
    var action: () -> Void

    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.height, geometry.size.width)
            
            Button(action:  action ) {
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
                    .foregroundColor(isMarked ? .blue : .primary)
                    .shadow(radius: size * 0.1)
                    .padding()
            }
            .disabled(!isOn)
        }
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonView(isMarked: true, isOn: true, action: {})
            .preferredColorScheme(.dark)
    }
}
