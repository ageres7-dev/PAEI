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
    let label: String
    
    private var progress: CGFloat {
        CGFloat(currentValue) / CGFloat(maxValue)
    }
    
    var body: some View {

        ZStack {
            Color.red
            VStack {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .opacity(0.3)
                            .foregroundColor(.blue)
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: 270))
                            .animation(.easeInOut)
                        Text(labelValue)
                            .font(.largeTitle)
                            .bold()
                    }
//                    .frame(width: 100, height: 100)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                    Text(label)
                        .font(.title)
                }

//            .padding()
        }
    }
}

struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(currentValue: 2, maxValue: 12, label: "Баллы")
            .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
