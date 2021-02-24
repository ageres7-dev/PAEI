//
//  Сondition.swift
//  PAEI
//
//  Created by Сергей on 23.01.2021.
//

struct Сondition: Codable {
    var isTestPassed = false
    var isTestRunning = false
    var answer = Answer()
    var valuesPassingTest = ValuesPassingTest()
}
