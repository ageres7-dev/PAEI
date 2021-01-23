//
//  PassingTest.swift
//  PAEI
//
//  Created by Сергей on 05.01.2021.
//

import SwiftUI

struct PassingTest: View {
//        @EnvironmentObject var modalState: ScreenManager
    @EnvironmentObject var conditionManager: СonditionManager
    
    @State private var producerValue = 0
    @State private var administratorValue = 0
    @State private var entrepreneurValue = 0
    @State private var integratorValue = 0
    @State private var currentIndexBlock = 0
    @State private var answers: [Answer] = []
    
    @State private var isShowingResultView = false
    @State private var showHelp = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top) )
            {
      
                VStack {
                    HStack {
                        Spacer(minLength: 16)
                        VStack {
                            Text("Баллов")
                            CircleProgressBar(
                                currentValue: pointsTotal,
                                maxValue: 10,
                                insideLabel: "\(pointsTotal)/10"
                            )
                        }
                        Spacer(minLength: 16)
                        VStack {
                            Text("Блок")
                            CircleProgressBar(currentValue: currentIndexBlock + 1,
                                              maxValue: сharacteristicBlocks.count,
                                              insideLabel: "\(currentIndexBlock + 1)/\(сharacteristicBlocks.count)"
                            )
                        }
                        Spacer(minLength: 16)
                    }
                    .frame(maxHeight: 150)
                    
                    //                Spacer(minLength: 20)
                    Spacer()
                    
                    CharacteristicsRadioButtonGroup(
                        producerValue: $producerValue,
                        administratorValue: $administratorValue,
                        entrepreneurValue: $entrepreneurValue,
                        integratorValue: $integratorValue,
                        currentCharacteristic: currentCharacteristic
                    )
                    .frame(minHeight: 320, maxHeight: 400)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                    Spacer()
                    
                    ZStack {
                        Button(action: isNextButtom
                                ? actionNextButton
                                : actionFinishButton) {
                            Text(isNextButtom
                                    ? "Cледующий блок"
                                    : "Показать результат")
                                .bold()
                                .setBlueStyleButton(disabledStyle: pointsTotal != 10)
                        }
              
                
                        
                        NavigationLink(
                            destination: ResultView(answer: sumAllAnswers),
                            isActive: $isShowingResultView,
                            label: { EmptyView() }
                        )
                    }
                    
                    .animation(nil)
                    .disabled(pointsTotal != 10)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    
                    Button(action: actionBackButton) {
                        Text("Предыдущий блок")
                    }
                    .disabled(currentIndexBlock == 0)
                    
                }
                .padding()
                .navigationBarHidden(true)
                
                Button(action: { showHelp.toggle() }) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $showHelp, content: {
                    Alert(
                        title: Text("Оцените Ваши личные качества – КАКОЙ Я?"),
                        message: Text("Будьте внимательны, описывайте себя, а не Вашу работу. Расставьте оценки от 1 (наименее подходящая для меня характеристика) до 4 баллов (наиболее подходящая). \nЧем меньше балл, тем  менее выражено качество. В сумме должно получиться 10 баллов в каждом.")
                    )
                })
//                .alert(isPresented: $showHelp) {
//                    Alert(title: "789", message: "Leevfq")
//                }
                .padding()

                
            }
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
                
//                Button(action: {}) {
//                    Image(systemName: "questionmark.circle")
//                }
//            }
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
        //        modalState.isModalPresentResultView = true
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        conditionManager.condition.isTestPassed = true
        conditionManager.condition.answer = sumAllAnswers
        DataManager.shared.save(
            condition: conditionManager.condition
        )
        
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
    
    private var сharacteristicBlocks: [CharacteristicBlock] {
        CharacteristicBlock.getBlocks()
    }
    
    private var currentCharacteristic: CharacteristicBlock {
        сharacteristicBlocks[currentIndexBlock]
    }
    
    private var isNextButtom: Bool {
        currentIndexBlock != сharacteristicBlocks.count - 1
//                currentIndexBlock + 1 != 2
        
        
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
    
//    private var sumAllAnswers: Answer { sumAllAnswers(from: answers) }
    
    private var sumAllAnswers: Answer {
        
        var result = Answer()
        answers.forEach { answer in
            result.producer += answer.producer
            result.administrator += answer.administrator
            result.entrepreneur += answer.entrepreneur
            result.integrator += answer.integrator
        }
        return result
    }

}


struct PassingTest_Previews: PreviewProvider {
    static var previews: some View {
        PassingTest()
            .preferredColorScheme(.light)
    }
}
