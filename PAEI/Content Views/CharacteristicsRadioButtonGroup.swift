//
//  CharacteristicsView.swift
//  PAEI
//
//  Created by Сергей on 04.01.2021.
//

import SwiftUI

struct CharacteristicsRadioButtonGroup: View {
    /*
    @State private var producerValue = 0
    @State private var administratorValue = 0
    @State private var entrepreneurValue = 0
    @State private var integratorValue = 0
    
    private var currentCharacteristic: CharacteristicBlock {
        CharacteristicBlock.getBlocks()[currentNumberBlock]
    }
    
    private var currentNumberBlock = 0
    */
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var producerValue: Int
    @Binding var administratorValue: Int
    @Binding var entrepreneurValue: Int
    @Binding var integratorValue: Int
    
    var currentCharacteristic: CharacteristicBlock

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
//                .foregroundColor(colorScheme == .dark ? .customGray : .white)
                .foregroundColor(colorScheme == .dark ? Color(.systemGray5) : .white)
//                .shadow(color: .black, radius: 15, x: 0, y: 0)
                .shadow(radius: isSmallScreen ? 10 : 25)
            
//        Group {
             VStack {
                Group{
                RadioButtons(currentValue: $producerValue,
                             availablePoints: availablePoints,
                             label: currentCharacteristic.qualityProducer,
                             closure: autoPresLastButton)
                
                RadioButtons(currentValue: $administratorValue,
                             availablePoints: availablePoints,
                             label: currentCharacteristic.qualityAdministrator,
                             closure: autoPresLastButton)
                
                RadioButtons(currentValue: $entrepreneurValue,
                             availablePoints: availablePoints,
                             label: currentCharacteristic.qualityEntrepreneurs,
                             closure: autoPresLastButton)
                
                RadioButtons(currentValue: $integratorValue,
                             availablePoints: availablePoints,
                             label: currentCharacteristic.qualityIntegrator,
                             closure: autoPresLastButton)
                }
                .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
            }
            .offset(y: -4)
//            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .padding(20)
//        }
//            .setCustomBackgroung()
//            .shadow(radius: 25)
//            .opacity(0.9)
//            .offset(y: -4)
//            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
//            .animation(.none)
        }
    }
}

extension CharacteristicsRadioButtonGroup {

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
    
//    private var shadowColor: Color {
//        colorScheme == .dark ? .blue : .gray
//    }
    private var availablePoints: Int {
        maxPoint - pointsTotal - countUncheckedCharacteristics
    }
    
    //Вынести отсюда
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
        /*
         for characteristic in characteristics {
         result += characteristic == 0 ? 1 : 0
         }
         */
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
            currentCharacteristic: CharacteristicBlock.getBlocks()[1]
        )
    }
}


