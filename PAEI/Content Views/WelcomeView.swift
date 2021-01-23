//
//  WelcomeView.swift
//  PAEI
//
//  Created by Сергей on 08.01.2021.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var modalState: ScreenManager
    @EnvironmentObject var conditionManager: СonditionManager
    
    //    @State private var isShowingResultView = false
//    @State private var isShowingInstructionsView = false
    
    //    let savedAnswer =
    
    //    @State private var isPresentPassingTest = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScrollView {
                    
                    if conditionManager.condition.isTestPassed {
                        Button(action: {
                            modalState.isModalPresentResultView.toggle()
                            
                        }) {
                            Text("Последний результат теста")
                                .bold()
                                .setBlueStyleButton(color: .green)
                        }
                        .padding()
                        .sheet(isPresented: $modalState.isModalPresentResultView) {
                            
                            NavigationView {
                                ResultView(answer: conditionManager.condition.answer,
                                           isNewResult: false)
                                    .toolbar {
                                        
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            Button("Закрыть") {
                                                modalState.isModalPresentResultView = false
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    
                    Group {
                        VStack {
                            Image(systemName: "person.3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                                .padding(
                                    EdgeInsets(top: 0,
                                               leading: 0,
                                               bottom: 8,
                                               trailing: 0)
                                )
                            Text("В своей книге \"Идеальный руководитель\" Ицхак Адизес утверждает, что у менеджмента есть четыре функции, от успешной реализации которых зависит благополучие организации. Это производство результатов (P), администрирование (A), предпринимательство (E) и интеграция (I).")
                        }
                        .setCustomBackgroung()
                        
                        TextBlockView(imagaSystemName: "p.circle.fill",
                                      key: "P",
                                      title: "ЧТО НУЖНО СДЕЛАТЬ?",
                                      text: "Данная функция менеджмента отвечает за удовлетворение потребностей клиентов. От этого зависит результативность компании в краткосрочной перспективе.")
                        
                        TextBlockView(imagaSystemName: "a.circle.fill",
                                      key: "A",
                                      title: "КАК ЭТО НУЖНО СДЕЛАТЬ?",
                                      text: "Организация должна в правильной последовательности делать правильные вещи. Администратор обеспечивает данный процесс.")
                        
                        TextBlockView(imagaSystemName: "e.circle.fill",
                                      key: "E",
                                      title: "КОГДА/ЗАЧЕМ ЭТО НУЖНО СДЕЛАТЬ?",
                                      text: "Придерживаясь творческого подхода и готовность идти на риск менеджент также должен ориентироваться в хаосе изменений и определять направление развития компании.")
                        TextBlockView(imagaSystemName: "i.circle.fill",
                                      key: "I",
                                      title: "КТО ЭТО ДОЛЖЕН СДЕЛАТЬ?",
                                      text: "Руководителю нужно уметь создавать в компании такую систему ценностей, которая в свою очередь сформирует в команде атмосферу взаимоуважения и сотрудничества.")
                        
                    }
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    
                }.shadow(radius: 25)
                
                
                Button(action: {
                    modalState.isShowingInstructionsView.toggle()
                    print("fuck")
                    
                }) {
                    Text("Дальше")
                        .bold()
                        .setBlueStyleButton()
                }
                .padding()
                
                NavigationLink(
                    destination: InstructionsView(),
                    isActive: $modalState.isShowingInstructionsView,
                    label: { EmptyView() }
                )
                /*
                Button(action: {
                    modalState.isModalPresentPassingTest.toggle()
                    
                }) {
                    Text("Начать тест")
                        .bold()
                        .setBlueStyleButton()
                }
                .padding()
                .fullScreenCover(
                    isPresented: $modalState.isModalPresentPassingTest,
                    content: PassingTest.init
                )
                */
                
            }
            .navigationBarTitle("Модель PAEI")// 􀀣􀀅􀀍􀀕
        }
        
    }
}




struct TextBlockView: View {
    let imagaSystemName: String
    let key: String
    let title: String
    let text: String
    var body: some View {
        VStack { //HStack(alignment: .top)
//            Text(key)
//                .bold()
//                .font(.system(size: 70))
//                .offset(y: -15)
//                .frame(width: 70)
            Image(systemName: imagaSystemName) //"p.circle"
                //                .bold()
//                .foregroundColor(.blue)
                .font(.system(size: 70))
//                .offset(y: -15)
                .frame(width: 70)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            Text(title)
                .bold()
            
            Spacer(minLength: 4)
            Text(text)
//            Text("ЧТО НУЖНО СДЕЛАТЬ? \n\nДанная функция менеджмента отвечает за удовлетворение потребностей клиентов. От этого зависит результативность компании в краткосрочной перспективе.")
            
        }
        .setCustomBackgroung()
        
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
