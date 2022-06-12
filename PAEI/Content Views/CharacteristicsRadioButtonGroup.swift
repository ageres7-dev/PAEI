//
//  CharacteristicsView.swift
//  PAEI
//
//  Created by Сергей on 04.01.2021.
//

import SwiftUI

struct CharacteristicsRadioButtonGroup: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var producerValue: Int
    @Binding var administratorValue: Int
    @Binding var entrepreneurValue: Int
    @Binding var integratorValue: Int
    
    let currentCharacteristic: CharacteristicBlock
    let disabledButtonAction: () -> Void
    let keys: [Key]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(colorScheme == .dark ? Color(.systemGray5) : .white)
                .shadow(radius: isSmallScreen ? 10 : 25)
   
            VStack {
                Group{
                    RadioButtons(
                        currentValue: setFuncFrom(key: keys[0]),
                        otherValueOne: setFuncFrom(key: keys[1]),
                        otherValueTwo: setFuncFrom(key: keys[2]),
                        otherValueThree: setFuncFrom(key: keys[3]),
                        label: setLabelFrom(key: keys[0]),
                        enabledButtonAction: autoPresLastButton,
                        disabledButtonAction: disabledButtonAction
                    )
                    RadioButtons(
                        currentValue: setFuncFrom(key: keys[1]),
                        otherValueOne: setFuncFrom(key: keys[0]),
                        otherValueTwo: setFuncFrom(key: keys[2]),
                        otherValueThree: setFuncFrom(key: keys[3]),
                        label: setLabelFrom(key: keys[1]),
                        enabledButtonAction: autoPresLastButton,
                        disabledButtonAction: disabledButtonAction
                    )
                    
                    RadioButtons(
                        currentValue: setFuncFrom(key: keys[2]),
                        otherValueOne: setFuncFrom(key: keys[0]),
                        otherValueTwo: setFuncFrom(key: keys[1]),
                        otherValueThree: setFuncFrom(key: keys[3]),
                        label: setLabelFrom(key: keys[2]),
                        enabledButtonAction: autoPresLastButton,
                        disabledButtonAction: disabledButtonAction
                    )
                    
                    RadioButtons(
                        currentValue: setFuncFrom(key: keys[3]),
                        otherValueOne: setFuncFrom(key: keys[0]),
                        otherValueTwo: setFuncFrom(key: keys[1]),
                        otherValueThree: setFuncFrom(key: keys[2]),
                        label: setLabelFrom(key: keys[3]),
                        enabledButtonAction: autoPresLastButton,
                        disabledButtonAction: disabledButtonAction
                    )
                    
                }
                .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
            }
            .offset(y: -4)
            .padding(
                EdgeInsets(
                    top: 20,
                    leading: isBigScreen ? 34 : 20,
                    bottom: 20,
                    trailing: isBigScreen ? 34 : 20
                )
            )
        }
    }
}

extension CharacteristicsRadioButtonGroup {
    
    private func setFuncFrom(key: Key) -> Binding<Int> {
        var result = $integratorValue
        switch key {
        case .p:
            result = $producerValue
        case .a:
            result = $administratorValue
        case .e:
            result = $entrepreneurValue
        case .i:
            result =  $integratorValue
        }
        return result
    }
    
    private func setLabelFrom(key: Key) -> String {
        var result = ""
        switch key {
        case .p:
            result = currentCharacteristic.qualityProducer
        case .a:
            result = currentCharacteristic.qualityAdministrator
        case .e:
            result = currentCharacteristic.qualityEntrepreneurs
        case .i:
            result =  currentCharacteristic.qualityIntegrator
        }
        return result
    }
    
    private func autoPresLastButton() {
        guard countUncheckedCharacteristics == 1 else { return }
        var setValue: Int {
            let availablePoints = maxPoint - pointsTotal
            return (0...4).contains(availablePoints) ? availablePoints : 4
        }
        
        if integratorValue == 0 {
            integratorValue = setValue
        } else if entrepreneurValue == 0 {
            entrepreneurValue = setValue
        } else if administratorValue == 0 {
            administratorValue = setValue
        } else if producerValue == 0 {
            producerValue = setValue
        }
    }
    
    
    
    private var maxPoint: Int { 10 }
    
//    private var availablePoints: Int {
//        maxPoint - pointsTotal - countUncheckedCharacteristics
//    }
    
    private var pointsTotal: Int {
        (producerValue + administratorValue
            + entrepreneurValue + integratorValue)
    }
    
    private var countUncheckedCharacteristics: Int {
        var result = 0
        let characteristics = [producerValue,
                               administratorValue,
                               entrepreneurValue,
                               integratorValue]
        characteristics.forEach {
            result += $0 == 0 ? 1 : 0
        }
        return result
    }
}


struct CharacteristicsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteristicsRadioButtonGroup(
            producerValue: .constant(1),
            administratorValue: .constant(2),
            entrepreneurValue: .constant(3),
            integratorValue: .constant(4),
            currentCharacteristic: CharacteristicBlock.getBlocks()[1],
            disabledButtonAction: {},
            keys: [.p, .a, .e, .i]
        )
    }
}


