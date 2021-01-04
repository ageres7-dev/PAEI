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
    
    private var availablePoints: Int {
        let result = 10 - producerValue - administratorValue - entrepreneurValue - integratorValue - CountUnansweredCharacteristic

//        if CountUnansweredCharacteristic == 2 {
//            result = (result + 1) / 2
//        }
        
        return result
    }
    
    private var currentNumberBlock = 0
//    private let characteristicBlocks = CharacteristicBlock.getBlocks()
    private var currentCharacteristic: CharacteristicBlock {
        CharacteristicBlock.getBlocks()[currentNumberBlock]
    }
    private var pointsTotal: Int {
        (producerValue + administratorValue
            + entrepreneurValue + integratorValue)
    }
    
    private var CountUnansweredCharacteristic: Int {
//        producerValue == 0 ? 1 : 0
        var result = 0
        for characteristic in [producerValue, administratorValue, entrepreneurValue,integratorValue] {
            result += characteristic == 0 ? 1 : 0
        }
        return result
    }

    var body: some View {
        VStack {
            Text("Количество баллов \(pointsTotal)")
                .font(.title)
            Text("Остаток баллов \(availablePoints)")
                .font(.title)
            Text("unansweredCharacteristic \(CountUnansweredCharacteristic)")
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
    
}


struct CharacteristicsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteristicsView()
    }
}
