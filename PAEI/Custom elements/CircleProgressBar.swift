//
//  CircleProgressBarView.swift
//  PAEI
//
//  Created by Сергей on 07.01.2021.
//

import SwiftUI

struct CircleProgressBar: View {
    let currentValue: Int
    let maxValue: Int
    let insideLabel: String
    var fontValueIndex: CGFloat = 0.3
    var color: Color = .blue
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.height
            let line = size * 0.12
            let fontValue = size * fontValueIndex
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                Circle()
                    .stroke(lineWidth: line)
                    .opacity(0.3)
                    .foregroundColor(color)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: line,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeOut, value: progress)
                Text(insideLabel)
                    .font(.system(size: fontValue))
                    .bold()
                    .multilineTextAlignment(.center)
                
            }
            .frame(width: geometry.size.width,
                                   height: geometry.size.height,
                                   alignment: .top)
            .scaleEffect(0.95)
        }
    }
    
    private var progress: CGFloat {
        CGFloat(currentValue) / CGFloat(maxValue)
    }
}

struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(currentValue: 12, maxValue: 12, insideLabel: "label")
            .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
