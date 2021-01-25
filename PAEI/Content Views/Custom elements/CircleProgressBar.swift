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
    
    private var progress: CGFloat {
        CGFloat(currentValue) / CGFloat(maxValue)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            //                let size = max(geometry.size.height, geometry.size.width)
            let size = geometry.size.height
            let line = size * 0.12
            let fontValue = size * 0.3
            
            ZStack {
                Circle()
                    .stroke(lineWidth: line)
                    .opacity(0.3)
                    .foregroundColor(.blue)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: line,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeOut)
                Text(insideLabel)
                    .font(.system(size: fontValue))
                    .bold()
                
            }
            .scaleEffect(0.95)
        }
    }
}

struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(currentValue: 12, maxValue: 12, insideLabel: "label")
            .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
