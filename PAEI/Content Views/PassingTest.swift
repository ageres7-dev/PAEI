//
//  PassingTest.swift
//  PAEI
//
//  Created by Сергей on 05.01.2021.
//

import SwiftUI

struct PassingTest: View {
    @State private var producerValue = 0
    @State private var administratorValue = 0
    @State private var entrepreneurValue = 0
    @State private var integratorValue = 0
    @State private var currentIndexBlock = 0
    @State private var answers: [Answer] = []
    
    private var сharacteristicBlocks = CharacteristicBlock.getBlocks()
    
    private var currentCharacteristic: CharacteristicBlock { сharacteristicBlocks[currentIndexBlock]
    }
    
    
//    private var resultTest = Answer()
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Баллов \(pointsTotal)")
                    Spacer()
                    Text("Блок \(currentIndexBlock + 1) из 12")
                    Spacer()
                }
                
                CharacteristicsRadioButtonGroup(
                    producerValue: $producerValue,
                    administratorValue: $administratorValue,
                    entrepreneurValue: $entrepreneurValue,
                    integratorValue: $integratorValue,
                    currentCharacteristic: currentCharacteristic
                )
                
                Group {
                    if currentIndexBlock + 1 != 3 { //сharacteristicBlocks.count
                        Button(action: actionNextButton){
                            Text("Cледующий блок")
                                .font(.title)
                        }
                    } else {
                        
//                        Group {
//
//                            NavigationLink("Показать результат", destination: ResultView(answers: answers))
//                                .font(.title)
//                        }
                        
                    
                        
                            NavigationLink("Finish", destination: ResultView(answers: answers))
                                .font(.title)
                        
                        
                    }
                }.disabled(pointsTotal != 10)
                
                
            }
            .padding()
        }
        
    }
}

extension PassingTest {
    private func actionNextButton() -> Void {
        addCurrenAnswer()
        clearAllValue()
        currentIndexBlock += 1
        
        print(answers)
    }
    
    private func addCurrenAnswer() {
        let newAnswer = Answer(producer: producerValue,
                               administrator: administratorValue,
                               entrepreneur: entrepreneurValue,
                               integrator: integratorValue)
        answers.append(newAnswer)
        print("добавилт ответ")
    }
    
    
    private func actionFinishButton() -> Void {
        addCurrenAnswer()
    }
    
//    private func totalFromAnswers() -> Answer {
//        var producer = 0
//        var administrator = 0
//        var entrepreneur = 0
//        var integrator = 0
//        
//        answers.forEach { answer in
//            producer += answer.producer
//            administrator += answer.administrator
//            entrepreneur += answer.entrepreneur
//            integrator += answer.integrator
//        }
//        return Answer(producer: producer,
//                      administrator: administrator,
//                      entrepreneur: entrepreneur,
//                      integrator: integrator)
//    }
    
    private func clearAllValue() {
        producerValue = 0
        administratorValue = 0
        entrepreneurValue = 0
        integratorValue = 0
    }
    
    
    private var pointsTotal: Int {
        (producerValue + administratorValue
            + entrepreneurValue + integratorValue)
    }
}

struct PassingTest_Previews: PreviewProvider {
    static var previews: some View {
        PassingTest()
    }
}
