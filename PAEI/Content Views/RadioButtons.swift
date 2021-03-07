//
//  RadioButtons.swift
//  PAEI
//
//  Created by Сергей on 03.01.2021.
//

import SwiftUI

struct RadioButtons: View {
    @Binding var currentValue: Int
    @Binding var otherValueOne: Int
    @Binding var otherValueTwo: Int
    @Binding var otherValueThree: Int
    let availablePoints: Int
    let label: String
    let enabledButtonAction: () -> Void
    let disabledButtonAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(isSmallScreen ? .body : .title3)
                    .multilineTextAlignment(.leading)
                    .offset(y: 4)
                    
                Spacer()
            }
            HStack {
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 1,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 2,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 3,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 4,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
            }
        }
        .frame(minHeight: 50, maxHeight: 100)
    }
}


struct RadioButton: View {
    @Binding var value: Int
    let otherValues: (Int, Int, Int)
    let buttonValue: Int
    let availablePoints: Int
    let enabledButtonAction: () -> Void
    let disabledButtonAction: () -> Void
//    let isOn: Bool
    
    var body: some View {
        VStack {
            Text("\(buttonValue)")
                .font(.subheadline)
                .offset(y: 6)

            Button(action: {
                isOn ? action : disabledButtonAction()
            }) {
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
                    .foregroundColor(.primary)
            }
//            .disabled(!isOn)
            .frame(width: 20, height: 20)
        }
    }
}

extension RadioButton {
    private var action: () {
        if isMarked {
            value = 0
        } else {
            value = buttonValue
        }
        
        enabledButtonAction()
        
        
    }
        
    private var isMarked: Bool {
        value == buttonValue
        
    }
    
    private var isOn: Bool {
//        buttonValue <= availablePoints + (value == 0 ? 1 : value)

        buttonValue != otherValues.0
            && buttonValue != otherValues.1
            && buttonValue != otherValues.2
//        return true
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtons(
            currentValue: .constant(2),
            otherValueOne: .constant(2),
            otherValueTwo: .constant(2),
            otherValueThree: .constant(2),
            availablePoints: 1,
            label: "Уважающий",
            enabledButtonAction: {},
            disabledButtonAction: {}
        )
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(
            value: .constant(3),
            otherValues: (0, 0, 0),
            buttonValue: 3,
            availablePoints: 3,
            enabledButtonAction : {},
            disabledButtonAction: {}
        )
    }
}
