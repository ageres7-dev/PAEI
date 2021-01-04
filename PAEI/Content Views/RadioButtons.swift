//
//  RadioButtons.swift
//  PAEI
//
//  Created by Сергей on 03.01.2021.
//

import SwiftUI

struct RadioButtons: View {
    @Binding var currentValue: Int
    let availablePoints: Int
    let label: String
    let closure: () -> Void
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
                            availablePoints: availablePoints,
                            closure: closure)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 2,
                            availablePoints: availablePoints,
                            closure: closure)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 3,
                            availablePoints: availablePoints,
                            closure: closure)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 4,
                            availablePoints: availablePoints,
                            closure: closure)
            }

        }.frame(minHeight: 40, maxHeight: 100)
    }
}


struct RadioButton: View {
    @Binding var value: Int
    let buttonValue: Int
    let availablePoints: Int
    let closure: () -> Void
    
    var body: some View {
        VStack {
            Text("\(buttonValue)")
                .font(.title2)
                .offset(y: 6)

            Button(action: { action }) {
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
                    .foregroundColor(.primary)
            }
            .disabled(!isOn)
        }
    }
}

extension RadioButton {
    private var action: () {
        value = buttonValue
        closure()
    }
    
    private var isMarked: Bool { value == buttonValue }
    
    private var isOn: Bool {
        buttonValue <= availablePoints + (value == 0 ? 1 : value)
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtons(currentValue: .constant(2), availablePoints: 1, label: "Уважающий", closure: {})        
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(value: .constant(3), buttonValue: 3, availablePoints: 3, closure: {})
    }
}
