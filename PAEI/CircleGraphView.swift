//
//  CircleGraphView.swift
//  PAEI
//
//  Created by Сергей on 17.01.2021.
//

import SwiftUI

struct CircleGraph: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let pValue: Int
    let aValue: Int
    let eValue: Int
    let iValue: Int
 
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(colorScheme == .dark ? .customGray : .white)

            GeometryReader { geometry in
                HStack {
                    CircleProgressBar(
                        currentValue: pValue,
                        maxValue: 48,
                        insideLabel: "P=\(pValue)"
                    )
                    Spacer(minLength: 16)
                    CircleProgressBar(
                        currentValue: aValue,
                        maxValue: 48,
                        insideLabel: "A=\(aValue)"
                    )
                    Spacer(minLength: 16)
                    CircleProgressBar(
                        currentValue: eValue,
                        maxValue: 48,
                        insideLabel: "E=\(eValue)"
                    )
                    Spacer(minLength: 16)
                    CircleProgressBar(
                        currentValue: iValue,
                        maxValue: 48,
                        insideLabel: "I=\(iValue)"
                    )
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct CircleGraphView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGraph(pValue: 3, aValue: 5, eValue: 34, iValue: 36)
            .frame(height: 100)
    }
}
