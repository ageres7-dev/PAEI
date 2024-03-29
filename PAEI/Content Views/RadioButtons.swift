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
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 2,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 3,
                            enabledButtonAction : enabledButtonAction,
                            disabledButtonAction: disabledButtonAction)
                Spacer()
                RadioButton(value: $currentValue,
                            otherValues: (otherValueOne, otherValueTwo, otherValueThree),
                            buttonValue: 4,
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
    let enabledButtonAction: () -> Void
    let disabledButtonAction: () -> Void
    
    var body: some View {
        
        Button(action: {
            isOn ? action : disabledButtonAction()
        }) {
            VStack {
                Text("\(buttonValue)")
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .font(.system(size: 20))
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
            }
        }

        .frame(width: 24, height: 20)
    }
}

extension RadioButton {
    private var action: () {
        if isMarked {
            value = 0
        } else {
            value = buttonValue
            enabledButtonAction()
        }
    }
    
    private var isMarked: Bool {
        value == buttonValue
        
    }
    
    private var isOn: Bool {
        buttonValue != otherValues.0
        && buttonValue != otherValues.1
        && buttonValue != otherValues.2
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtons(
            currentValue: .constant(2),
            otherValueOne: .constant(2),
            otherValueTwo: .constant(2),
            otherValueThree: .constant(2),
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
            enabledButtonAction : {},
            disabledButtonAction: {}
        )
    }
}
