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
    let enabledButtonAction: () -> Void
    let disabledButtonAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(isSmallScreen ? .body : .title3) //.body
                    .multilineTextAlignment(.leading)
                    .offset(y: 4)
                    
                Spacer()
            }
            HStack {
                RadioButton(value: $currentValue,
                            buttonValue: 1,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 2,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            buttonValue: 3,
                            availablePoints: availablePoints,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
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
    let buttonValue: Int
    let availablePoints: Int
    let enabledButtonAction : () -> Void
    let disabledButtonAction : () -> Void
    
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
        value = buttonValue
        enabledButtonAction ()
    }
        
    private var isMarked: Bool { value == buttonValue }
    
    private var isOn: Bool {
        buttonValue <= availablePoints + (value == 0 ? 1 : value)
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtons(currentValue: .constant(2), availablePoints: 1, label: "Уважающий", enabledButtonAction: {}, disabledButtonAction: {})
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(value: .constant(3), buttonValue: 3, availablePoints: 3, enabledButtonAction : {}, disabledButtonAction: {})
    }
}
