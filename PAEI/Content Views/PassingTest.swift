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
    
    

    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    CircleProgressBar(currentValue: pointsTotal,
                                      maxValue: 10,
                                      label: "Баллов"
                    )
                    Spacer()
                    CircleProgressBar(currentValue: currentIndexBlock + 1,
                                      maxValue: 12,
                                      label: "Блок"
                    )
                    Spacer()
                }
                .frame(height: 130)
                

                
                CharacteristicsRadioButtonGroup(
                    producerValue: $producerValue,
                    administratorValue: $administratorValue,
                    entrepreneurValue: $entrepreneurValue,
                    integratorValue: $integratorValue,
                    currentCharacteristic: currentCharacteristic
                )
//                .frame(height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
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
            .navigationBarHidden(true)
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
    }
    
    private func actionFinishButton() -> Void {
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
    
    private func clearAllValue() {
        producerValue = 0
        administratorValue = 0
        entrepreneurValue = 0
        integratorValue = 0
    }
    
    private var сharacteristicBlocks: [CharacteristicBlock] { CharacteristicBlock.getBlocks()
    }
    
    private var currentCharacteristic: CharacteristicBlock { сharacteristicBlocks[currentIndexBlock]
    }

    private var isNewAnswer: Bool {
        !(0..<answers.count).contains(currentIndexBlock + 1)
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
            .preferredColorScheme(.light)
    }
}
