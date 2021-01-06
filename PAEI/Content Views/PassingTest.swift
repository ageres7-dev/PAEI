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
                .disabled(currentIndexBlock == 0)
                
            }
            .padding()
        }
        
    }
}



extension PassingTest {
    
    private func actionNextButton() -> Void {
        
        if isNewAnswer {
            addCurrenAnswer()
            clearAllValue()
        } else {
            updateAnswer(at: currentIndexBlock)
            fetchAnswerBy(index: currentIndexBlock + 1)
        }
        currentIndexBlock += 1
    }
    
    private func actionBackButton() -> Void {
        guard currentIndexBlock > 0 else { return }
        
        if isNewAnswer {
            addCurrenAnswer()
            fetchAnswerBy(index: currentIndexBlock - 1)
        } else {
            updateAnswer(at: currentIndexBlock)
            fetchAnswerBy(index: currentIndexBlock - 1)
        }
        currentIndexBlock -= 1
//        updateAnswer(at: currentIndexBlock)
//
//        fetchAnswerBy(index: currentIndexBlock)
    }
    
    private func actionFinishButton() -> Void {
//        addCurrenAnswer()
        
        if isNewAnswer {
            addCurrenAnswer()
        } else {
            updateAnswer(at: currentIndexBlock)
        }
        isShowingResultView = true
        
    }
    
    private func addCurrenAnswer() {
        answers.append(currentEnteredAnswer)
    }
    
    private func updateAnswer(at index: Int) {
        answers.remove(at: index)
        answers.insert(currentEnteredAnswer, at: index)
    }
    
    private func fetchAnswerBy(index: Int) -> Void {
        let answer = answers[index]
        producerValue = answer.producer
        administratorValue = answer.administrator
        entrepreneurValue = answer.entrepreneur
        integratorValue = answer.integrator
    }
    

    

    private var isNewAnswer: Bool {
        !(0..<answers.count).contains(currentIndexBlock + 1)
    }
    
    private func clearAllValue() {
        producerValue = 0
        administratorValue = 0
        entrepreneurValue = 0
        integratorValue = 0
    }
    
    private var currentEnteredAnswer: Answer {
        Answer(producer: producerValue,
               administrator: administratorValue,
               entrepreneur: entrepreneurValue,
               integrator: integratorValue)
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
