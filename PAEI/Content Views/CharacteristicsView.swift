//
//  CharacteristicsView.swift
//  PAEI
//
//  Created by Сергей on 04.01.2021.
//

import SwiftUI

struct CharacteristicsView: View {
    @State private var producerValue = 0
    @State private var administratorValue = 0
    @State private var entrepreneurValue = 0
    @State private var integratorValue = 0
    
    var body: some View {
        VStack {
            Text("Количество баллов \(pointsTotal)")
                .font(.title)
            Text("Остаток баллов \(availablePoints)")
                .font(.title)
            Text("unansweredCharacteristic \(countUncheckedCharacteristics)")
                .font(.title)
            
            Spacer()
            
            RadioButtons(currentValue: $producerValue,
                         availablePoints: availablePoints,
                         label: currentCharacteristic.qualityProducer)
            
            RadioButtons(currentValue: $administratorValue,
                         availablePoints: availablePoints,
                         label: currentCharacteristic.qualityAdministrator)
            
            RadioButtons(currentValue: $entrepreneurValue,
                         availablePoints: availablePoints,
                         label: currentCharacteristic.qualityEntrepreneurs)
            
            RadioButtons(currentValue: $integratorValue,
                         availablePoints: availablePoints,
                         label: currentCharacteristic.qualityIntegrator)
            Spacer()
        }
        .padding()
    }
}

extension CharacteristicsView {
    private var availablePoints: Int {
        10 - pointsTotal - countUncheckedCharacteristics
    }
    
    private var currentNumberBlock: Int { 0 }
    
    private var currentCharacteristic: CharacteristicBlock {
        CharacteristicBlock.getBlocks()[currentNumberBlock]
    }
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
        CharacteristicsView()
    }
}
