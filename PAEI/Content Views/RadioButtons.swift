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
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .offset(y: 4)
                    
                Spacer()
            }
            HStack {
//                Spacer()
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
//                Spacer()
            }
        }
        .frame(minHeight: 50, maxHeight: 100)
    }
}


struct RadioButton: View {
//    @State private var showAlert = false
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
//                    showAlert.toggle()
                
            }) {
                Image(systemName: isMarked ? "largecircle.fill.circle": "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(isOn ? 1: 0.3)
                    .foregroundColor(.primary)
            }
//            .disabled(!isOn)
            .frame(width: 20, height: 20)
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("Ты дебил?"),
//                    message: Text("Читай инструкцию \(availablePoints)")
//                )
//            }

        }
    }
}

extension RadioButton {
    private var action: () {
//        UISelectionFeedbackGenerator().selectionChanged()
        value = buttonValue
        enabledButtonAction ()
    }
    
    private var actionDisabledButton: () {
//        UISelectionFeedbackGenerator().selectionChanged()
        
//        let generator = UIImpactFeedbackGenerator(style: .medium)
//        generator.impactOccurred()
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
//        showAlert.toggle()
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
