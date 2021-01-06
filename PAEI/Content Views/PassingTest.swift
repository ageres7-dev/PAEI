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
    
    @State private var isShowingResultView = false
    
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
                        }
                        
                    } else {

                        NavigationLink(
                            destination: ResultView(answers: answers),
                            isActive: $isShowingResultView,
                            label: { EmptyView() }
                        )
                        
                        Button(action: actionFinishButton) {
                            Text("Показать результат")
                        }
                    }
                }
                .font(.title)
                .disabled(pointsTotal != 10)
                
                
                Button(action: actionBackButton) {
                    Text("Предыдущий блок")
                }
                .font(.title)
                
            }
            .padding()
        }
        
    }
}



extension PassingTest {
    
    private func actionNextButton() -> Void {
        
//        if currentIndexBlock
        
        addCurrenAnswer()
        clearAllValue()
        currentIndexBlock += 1
    }
    
    private func addCurrenAnswer() {
        let newAnswer = Answer(producer: producerValue,
                               administrator: administratorValue,
                               entrepreneur: entrepreneurValue,
                               integrator: integratorValue)
        answers.append(newAnswer)
        print("добавил ответ")
    }
    
    
    private func fetchAnswerBy(index: Int) -> Void {
        let answer = answers[index]
        producerValue = answer.producer
        administratorValue = answer.administrator
        entrepreneurValue = answer.entrepreneur
        integratorValue = answer.integrator
    }
    
    private func actionBackButton() -> Void {
        guard currentIndexBlock > 0 else { return }
        currentIndexBlock -= 1
        fetchAnswerBy(index: currentIndexBlock)
    }
    
    private func actionFinishButton() -> Void {
        addCurrenAnswer()
        isShowingResultView = true
    }
    /*
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
    */
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
