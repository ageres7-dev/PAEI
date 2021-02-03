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
    
    private var progress: CGFloat {
        CGFloat(currentValue) / CGFloat(maxValue)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.height
            let line = size * 0.12
            let fontValue = size * fontValueIndex
            
            ZStack {
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
                    .animation(.easeOut)
                Text(insideLabel)
                    .font(.system(size: fontValue))
                    .bold()
                    .multilineTextAlignment(.center)
                
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



//struct RingBackgroundShape: Shape {
//    
//    var thickness: CGFloat
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.addArc(
//            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
//            radius: rect.width / 2 - thickness,
//            startAngle: Angle(degrees: 0),
//            endAngle: Angle(degrees: 360),
//            clockwise: false
//        )
//        return path
//            .strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
//    }
//    
//}
//
//
//struct RingBackgroundShape_Previews: PreviewProvider {
//    static var previews: some View {
//        RingBackgroundShape(thickness: 7)
//    }
//}
