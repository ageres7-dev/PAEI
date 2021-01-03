//
//  CharacteristicBlock.swift
//  HW2.8-pael
//
//  Created by Dmitry Shcherbakov on 08.11.2020.
//

struct CharacteristicBlock {
    let qualityProducer: String
    let qualityAdministrator: String
    let qualityEntrepreneurs: String
    let qualityIntegrator: String
}

extension CharacteristicBlock {
    static func getBlocks() -> [CharacteristicBlock] {
        let manager = DataManager.shared
        return manager.qualityOfProducers.enumerated().map() {
            CharacteristicBlock(qualityProducer: $1,
                  qualityAdministrator: manager.qualityOfAdministrators[$0],
                  qualityEntrepreneurs: manager.qualityOfEntrepreneurs[$0],
                  qualityIntegrator: manager.qualityOfIntegrators[$0])
        }
        
    }
    
}
