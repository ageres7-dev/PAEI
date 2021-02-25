//
//  InstructionsView.swift
//  PAEI
//
//  Created by Сергей on 22.01.2021.
//

import SwiftUI

struct InstructionsView: View {
    @EnvironmentObject var screenManager: ScreenManager
    @EnvironmentObject var conditionManager: СonditionManager
    @State private var showingActionSheet = false
    @State private var isShowingResultView = false
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    
                    //                        Image("default")
                    //                            .resizable()
                    //                            .aspectRatio(contentMode: .fill)
                    //                            .frame(height: screenSize.width * 0.55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //                            .clipped()
                    //                            .cornerRadius(20)
                    
                    
                    VStack(alignment: .leading){
                        HStack {
                            Spacer()
                            Image(systemName: "timer")
                                .resizable()
                                .multilineTextAlignment(.center)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 70)
                                .clipped()
                                .padding(.bottom, 4)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("Время прохождения теста: \n5 – 10 минут.")
                                .bold()
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                    }
                    .setCustomBackgroung()
                    
                    VStack {
                        
                        Text("Оцените ваши личные качества – КАКОЙ Я?")
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 4)
                        
                        Text("Необходимо ответить на 10 блоков, содержащие по 4 качества личности. Присвойте каждому качеству от 1-го до 4-ех баллов в зависимости от того, насколько оно подходит именно вам. Общая сумма баллов одного блока должна быть равна 10.")
                        
                    }
                    .setCustomBackgroung()
                    
                    Spacer(minLength: 82)
                    
                }
                .padding()
                
            }
            .shadow(radius: 25)
            
            BlurButton(text: "Начать тест") {
                if conditionManager.condition.isTestRunning {
                    showingActionSheet.toggle()
                } else {
                    showPassingTest()
                }
            }
            .fullScreenCover(isPresented: $screenManager.isModalPresentPassingTest) {
                PassingTest()
            }
            
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(
                    title: Text("Опаньки"),
                    message: Text("Вы не завершили предыдуший тест"),
                    buttons: [
                        .default(Text("Продолжить")) {
                            showPassingTest()
                        },
                        .destructive(Text("Начать заново")) {
                            actionStartAgain()
                        },
                        .cancel()
                ])
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Инструкция")
    }
}



extension InstructionsView {
    
    private func showPassingTest() {
        screenManager.isModalPresentPassingTest = true
        screenManager.isShowingInstructionsView = false
    }
    
    private func actionStartAgain() {
        conditionManager.condition.isTestRunning = false
        conditionManager.condition.valuesPassingTest = ValuesPassingTest()
        DataManager.shared.save(
            condition: conditionManager.condition
        )
        showPassingTest()
    }
    
    private var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
}



struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
            .environmentObject(ScreenManager())
    }
}
