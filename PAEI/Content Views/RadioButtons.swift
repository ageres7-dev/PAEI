//
//  RadioButtons.swift
//  PAEI
//
//  Created by Сергей on 03.01.2021.
//

import SwiftUI

struct RadioButtons: View {
//    @State private var currentValue = 4
    @Binding var currentValue: Int
    let availablePoints: Int
    let label: String
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    
                Spacer()
            }
            HStack {
                RadioButton(value: $currentValue,
                            buttonValue: 1,
                            availablePoints: availablePoints)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 2,
                            availablePoints: availablePoints)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 3,
                            availablePoints: availablePoints)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 4,
                            availablePoints: availablePoints)
            }
            
//            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }.frame(minHeight: 40, maxHeight: 100)
    }
}


struct RadioButton: View {
    @Binding var value: Int
    let buttonValue: Int
    let availablePoints: Int
    
    var body: some View {
        VStack {
            Text("\(buttonValue)")
                .font(.title2)
                .offset(y: 6)

            SimpleCircleButton(
                isMarked: value == buttonValue,
                isOn: buttonValue <= availablePoints + value,
                action: {value = buttonValue}
            )

        }
//        .padding()
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtons(currentValue: .constant(2), availablePoints: 1, label: "Уважающий")
//        RadioButtonGroups(availablePoints: 1)
        
    }
}
