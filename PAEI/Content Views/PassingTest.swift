//
//  PassingTest.swift
//  PAEI
//
//  Created by Сергей on 05.01.2021.
//

import SwiftUI

struct PassingTest: View {
    @EnvironmentObject var conditionManager: СonditionManager
    @State private var producerValue = 0
    @State private var administratorValue = 0
    @State private var entrepreneurValue = 0
    @State private var integratorValue = 0
    @State private var currentIndexBlock = 0
    @State private var answers: [Answer] = [Answer()]
    @State private var isShowingResultView = false
    @State private var showHelp = false
    @State private var showAlertDisabledButton = false
    //Необходимо для смены вопросов местами
    @State private var currentKey = ["p", "a", "e", "i"]
    @State private var keys: [[String]] = [["p", "a", "e", "i"]]
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
               
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer(minLength: 16)
                        VStack(spacing: isSmallScreen ? 0 : 16) {
                            Text("Баллов")
                                .offset( y: isSmallScreen ? -10 : 0)
                            CircleProgressBar(
                                currentValue: pointsTotal,
                                maxValue: 10,
                                insideLabel: "\(pointsTotal)/10"
                            )
                        }
                        Spacer(minLength: 16)
                        VStack(spacing: isSmallScreen ? 0 : 16) {
                            Text("Блок")
                                .offset( y: isSmallScreen ? -10 : 0)
                            CircleProgressBar(currentValue: currentIndexBlock + 1,
                                              maxValue: сharacteristicBlocks.count,
                                              insideLabel: "\(currentIndexBlock + 1)/\(сharacteristicBlocks.count)"
                            )
                        }
                        Spacer(minLength: 16)
                    }
                    .frame(minHeight: 0, idealHeight: 100, maxHeight: 160)
                    
                    Spacer()
                    
                    CharacteristicsRadioButtonGroup(
                        producerValue: $producerValue,
                        administratorValue: $administratorValue,
                        entrepreneurValue: $entrepreneurValue,
                        integratorValue: $integratorValue,
                        currentCharacteristic: currentCharacteristic,
                        disabledButtonAction: disabledButtonAction,
                        keys: currentKey
                    )
                    .alert(isPresented: $showAlertDisabledButton) {
                        Alert(
                            title: Text("Максимальное количество баллов 10")
//                            message: Text("Читай инструкцию")
                        )
                    }
                    
                    .frame(minHeight: 320, maxHeight: 450)
                    .padding(.top, isSmallScreen ? 8 : 20)
                    .padding(.bottom, isSmallScreen ? 8 : 20)
                    Spacer()
                    
                    
                    Button(action: isNextButtom
                            ? actionNextButton
                            : actionFinishButton) {
                        Text(isNextButtom
                                ? "Cледующий блок"
                                : "Показать результат")
                            .bold()
                            .setCustomStyleButton(disabledStyle: pointsTotal != 10)
                    }
                    .animation(nil)
                    .disabled(pointsTotal != 10)
                    .padding(.top, isSmallScreen ? 0 : 8)
                    .padding(.bottom, 8)
                    
                    NavigationLink(
                        destination: ResultView(answer: sumAllAnswers),
                        isActive: $isShowingResultView,
                        label: { EmptyView() }
                    )
                    
                    Button(action: actionBackButton) {
                        Text("Предыдущий блок")
                    }
                    //                    .offset(y: isSmallScreen ? 3 : 0)
                    .disabled(currentIndexBlock == 0)
//                    .padding(.top, isSmallScreen ? 0 : 8)
                    .frame(height: isSmallScreen ? 24 : 30)
                }

                .navigationBarHidden(true)
                
                HelpButton(isPresented: $showHelp)
                    .offset( y: isSmallScreen ? -10 : 0)
            }
            .padding()
        }
    }
}


extension PassingTest {
    
    private func disabledButtonAction() -> Void {
        showAlertDisabledButton.toggle()
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    private func actionNextButton() -> Void {
        print("actionNextButton()")
        print("currentIndexBlock \(currentIndexBlock) answers.count \(answers.count)")
//        print("isNotSavedAnswer \(isNotSavedAnswer)")
        print("isLastAnswer \(isLastAnswer)")
      
        updateAnswer(at: currentIndexBlock)
        if isLastAnswer {
            clearAllValue()
            addCurrenAnswer()
            
            newShuffledKey()
            addCurrenKey()
        } else {
            fetchAnswerBy(index: currentIndexBlock + 1)
            fetchKeyBy(index: currentIndexBlock + 1)
        }
        
        currentIndexBlock += 1
        
        
        /*
        if isNotSavedAnswer {
            addCurrenAnswer()
            clearAllValue()
            
            addCurrenKey()
            newShuffledKey()
            
        } else {
            updateAnswer(at: currentIndexBlock)
//            fetchAnswerBy(index: currentIndexBlock + 1)
            
            if isLastAnswer {
                addCurrenAnswer()
                clearAllValue()
                
                addCurrenKey()
                newShuffledKey()
            } else {
                fetchAnswerBy(index: currentIndexBlock + 1)
                fetchKeyBy(index: currentIndexBlock + 1)
            }
//            updateKey(at: currentIndexBlock)
            
        }
        */
        
//        currentIndexBlock += 1
        print("keys.count \(keys.count)")
        print("answers.count \(answers.count)")
        print("")
        print(keys)
        print(answers)
    }
    
    private func actionBackButton() -> Void {
        print("actionBackButton()")
        print("currentIndexBlock \(currentIndexBlock)  answers.count \(answers.count)")
//        print("isNotSavedAnswer \(isNotSavedAnswer)")
        print("isLastAnswer \(isLastAnswer)")
        
        
        guard currentIndexBlock > 0 else { return }
        updateAnswer(at: currentIndexBlock)
//        if isLastAnswer {
////            newShuffledKey()
//            addCurrenKey()
//        }
        fetchAnswerBy(index: currentIndexBlock - 1)
        fetchKeyBy(index: currentIndexBlock - 1)
        currentIndexBlock -= 1
        /*
        if isNotSavedAnswer {
            addCurrenAnswer()
            fetchAnswerBy(index: currentIndexBlock - 1)
            
            addCurrenKey()
            fetchKeyBy(index: currentIndexBlock - 1)
        } else {
            
            updateAnswer(at: currentIndexBlock)
            fetchAnswerBy(index: currentIndexBlock - 1)
            fetchKeyBy(index: currentIndexBlock - 1)
            */
            /*
            if isLastAnswer {
//                addCurrenAnswer()
                fetchAnswerBy(index: currentIndexBlock - 1)
//
//                addCurrenKey()
                fetchKeyBy(index: currentIndexBlock - 1)
            } else {
                
                fetchAnswerBy(index: currentIndexBlock - 1)
                
                //            updateKey(at: currentIndexBlock)
                fetchKeyBy(index: currentIndexBlock - 1)
            }
            
            */
//        }
        
        print("keys.count \(keys.count)")
        print("answers.count \(answers.count)")
        print("")
        print(keys)
        print(answers)
    }
    
    private func actionFinishButton() -> Void {
//        isNotSavedAnswer ? addCurrenAnswer() : updateAnswer(at: currentIndexBlock)
                UINotificationFeedbackGenerator().notificationOccurred(.success)
        updateAnswer(at: currentIndexBlock)
        isShowingResultView = true
        conditionManager.condition.isTestPassed = true
        conditionManager.condition.answer = sumAllAnswers
        DataManager.shared.save(
            condition: conditionManager.condition
        )
        print("actionFinishButton()")
        print(answers)
        print(answers.count)
    }
    //запоминание расположения вопросов
    private func newShuffledKey() {
        currentKey.shuffle()
    }
    
    private func addCurrenKey() {
        keys.append(currentKey)
    }
    
//    private func updateKey(at index: Int) {
//        keys.remove(at: index)
//        keys.insert(currentKey, at: index)
//    }
    
    private func fetchKeyBy(index: Int) {
        currentKey = keys[index]
    }
    
    //ответы
    private func addCurrenAnswer() {
        answers.append(currentEnteredAnswer)
    }
    
    private func updateAnswer(at index: Int) {
        answers.remove(at: index)
        answers.insert(currentEnteredAnswer, at: index)
    }
    
    private func fetchAnswerBy(index: Int) {
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
    /*
    //Текущий индекс блока не входит в
//    текущий ответ сохранен
    private var isNotSavedAnswer: Bool {
//        !(0..<answers.count).contains(currentIndexBlock + 1)
        !(0..<answers.count).contains(currentIndexBlock)
    }
    */
    //
    private var isLastAnswer: Bool {
        (currentIndexBlock + 1) == answers.count
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

struct HelpButton: View {
    @Binding var isPresented: Bool
    var body: some View {
        Button(action: { isPresented.toggle() }) {
            Image(systemName: "questionmark.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
        .alert(isPresented: $isPresented) {
            Alert(
                title: Text("Оцените Ваши личные качества – КАКОЙ Я?"),
                message: Text("Необходимо ответить на 12 блоков, содержащие по 4 качества личности. Присвойте каждому качеству от 1-го до 4-ех баллов в зависимости от того, насколько оно подходит именно вам. Общая сумма баллов одного блока должна быть равна 10.")
            )
        }
        .padding(.top, 8)
    }
}


struct PassingTest_Previews: PreviewProvider {
    static var previews: some View {
        PassingTest()
            .preferredColorScheme(.light)
    }
}
