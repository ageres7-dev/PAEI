//
//  СonditionManager.swift
//  PAEI
//
//  Created by Сергей on 23.01.2021.
//

import Combine

final class СonditionManager: ObservableObject {
    @Published var condition = Сondition()
    
    init() {}
    
    init(condition: Сondition) {
        self.condition = condition
    }
}
