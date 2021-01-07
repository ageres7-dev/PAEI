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
    private var labelValue: String {
        "\(currentValue)/\(maxValue)"
    }
//    let label: String
    
    private var progress: CGFloat {
        CGFloat(currentValue) / CGFloat(maxValue)
    }
    
    var body: some View {

//        ZStack {
//            Color.red
            GeometryReader { geometry in
//                let size = max(geometry.size.height, geometry.size.width)
                let size = geometry.size.height
                let line = size * 0.1
                let fontValue = size * 0.3
//                let fontLabel = size * 0.23
//            VStack {
//                Text(label)
//                    .font(.title2)
//                    .font(.system(size: fontLabel))
//                    .bold()
                    ZStack {
                        Circle()
                            .stroke(lineWidth: line)
                            .opacity(0.3)
                            .foregroundColor(.blue)
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(style: StrokeStyle(lineWidth: line, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: 270))
                            .animation(.easeInOut)
                        Text(labelValue)
                            .font(.system(size: fontValue))
                            .bold()
                        
                    }.offset(CGSize(width: 0, height: -3.0))
                    //                    .frame(width: 100, height: 100)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
//                }
                
                
            }
            
            //            .padding()
        
    }
}

struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(currentValue: 12, maxValue: 12)
            .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
