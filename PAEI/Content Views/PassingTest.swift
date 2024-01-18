//
//  PassingTest.swift
//  PAEI
//
//  Created by Сергей on 05.01.2021.
//

import SwiftUI

enum Key: String, Codable {
    case p, a, e, i
}

struct PassingTest: View {
    @EnvironmentObject var screenManager: ScreenManager
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
    @State private var currentKey: [Key] = [.p, .a, .e, .i]
    @State private var keys: [[Key]] = [[.p, .a, .e, .i]]
    @State private var activаteCircleProgressBar = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
               
                VStack(alignment: .center) {
                    Spacer()
                    
                    HStack {
                        Spacer(minLength: 16)
                        VStack(spacing: isSmallScreen ? 0 : 16) {
                            Text("Баллов")
                                .offset( y: isSmallScreen ? -10 : 0)
                            CircleProgressBar(
                                currentValue: activаteCircleProgressBar ? pointsTotal : 0,
                                maxValue: 10,
                                insideLabel: "\(pointsTotal)/10"
                            )
                        }
                        Spacer(minLength: 16)
                        VStack(spacing: isSmallScreen ? 0 : 16) {
                            Text("Блок")
                                .offset( y: isSmallScreen ? -10 : 0)
                            CircleProgressBar(
                                currentValue: activаteCircleProgressBar ? currentIndexBlock + 1 : 0,
                                maxValue: сharacteristicBlocks.count,
                                insideLabel: "\(currentIndexBlock + 1)/\(сharacteristicBlocks.count)"
                            )
                        }
                        Spacer(minLength: 16)
                    }
                    .frame(minHeight: 0, idealHeight: 100, maxHeight: 160)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation() {
                                activаteCircleProgressBar.toggle()
                                
                            }
                        }
                    }
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
                            title: Text("Внимание!"),
                            message: Text("В каждом блоке оценки НЕ повторяются")
                        )
                    }
                    
                    .frame(minHeight: 320, maxHeight: 450)
                    .padding(.top, isSmallScreen ? 8 : 20)
                    .padding(.bottom, isSmallScreen ? 8 : 20)
                    Spacer()
                    
                    Button(action: isNextButtom ? actionNextButton : actionFinishButton) {
                        Text(isNextButtom
                             ? "Cледующий блок"
                             : "Показать результат")
                        .bold()
                        .setCustomStyleButton(disabledStyle: pointsTotal != 10)
                    }
                    .transaction { transaction in
                        transaction.animation = nil
                    }
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
                    .disabled(currentIndexBlock == 0)
                    .frame(height: isSmallScreen ? 24 : 30)
                }
                .navigationBarHidden(true)
                HStack {
                    Button {
                        screenManager.isShowingInstructionsView = true
                        screenManager.isModalPresentPassingTest = false
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.top, 8)
                    .offset( y: isSmallScreen ? -10 : 0)
                    
                    Spacer()
                    HelpButton(isPresented: $showHelp)
                        .padding(.top, 8)
                        .offset( y: isSmallScreen ? -10 : 0)
                }
            }
            .padding()
            .onChange(of: producerValue) { _ in
                updateAnswer(at: currentIndexBlock)
                saveCurrentCondition()
            }
            .onChange(of: administratorValue) { _ in
                updateAnswer(at: currentIndexBlock)
                saveCurrentCondition()
            }
            .onChange(of: entrepreneurValue) { _ in
                updateAnswer(at: currentIndexBlock)
                saveCurrentCondition()
            }
            .onChange(of: integratorValue) { _ in
                updateAnswer(at: currentIndexBlock)
                saveCurrentCondition()
            }
            
            .onAppear{
                if conditionManager.condition.isTestRunning {
                    loadCurrentCondition()
                }
            }
        }
    }
}


extension PassingTest {
    
    private func saveCurrentCondition() {
        conditionManager.condition.valuesPassingTest.currentKey = currentKey
        conditionManager.condition.valuesPassingTest.keys = keys
        conditionManager.condition.valuesPassingTest.currentIndexBlock = currentIndexBlock
        conditionManager.condition.valuesPassingTest.answers = answers
        DataManager.shared.save(
            condition: conditionManager.condition
        )
    }
    
    private func loadCurrentCondition() {
        currentKey = conditionManager.condition.valuesPassingTest.currentKey
        keys = conditionManager.condition.valuesPassingTest.keys
        currentIndexBlock = conditionManager.condition.valuesPassingTest.currentIndexBlock
        answers = conditionManager.condition.valuesPassingTest.answers
        fetchAnswerBy(index: currentIndexBlock)
    }
    
    private func disabledButtonAction() -> Void {
        showAlertDisabledButton.toggle()
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    private func actionNextButton() -> Void {
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
        conditionManager.condition.isTestRunning = true
        saveCurrentCondition()
    }
    
    private func actionBackButton() -> Void {
        guard currentIndexBlock > 0 else { return }
        updateAnswer(at: currentIndexBlock)
        fetchAnswerBy(index: currentIndexBlock - 1)
        fetchKeyBy(index: currentIndexBlock - 1)
        currentIndexBlock -= 1
        
        saveCurrentCondition()
    }
    
    private func actionFinishButton() -> Void {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        updateAnswer(at: currentIndexBlock)
        isShowingResultView = true
        conditionManager.condition.isTestPassed = true
        conditionManager.condition.answer = sumAllAnswers
        conditionManager.condition.isTestRunning = false
        DataManager.shared.save(
            condition: conditionManager.condition
        )
        screenManager.isShowingInstructionsView = false
    }
    //запоминание расположения вопросов
    private func newShuffledKey() {
        currentKey.shuffle()
    }
    
    private func addCurrenKey() {
        keys.append(currentKey)
    }
    
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
    }

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
                title: Text("Описывайте себя, а не Вашу работу"),
                message:
                    Text("Расставьте оценки от 1 (наименее подходящая характеристика) до 4 баллов (наиболее подходящая). Чем меньше балл, тем  менее выражено качество. В каждом блоке оценки НЕ повторяются. В сумме должно получиться 10 баллов в каждом.")
                )
                
        }
    }
}


struct PassingTest_Previews: PreviewProvider {
    static var previews: some View {
        let condition = DataManager.shared.loadCondition()
        
        PassingTest()
            .environmentObject(ScreenManager())
            .environmentObject(СonditionManager(condition: condition))
            .preferredColorScheme(.light)
    }
}
