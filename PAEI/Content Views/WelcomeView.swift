//
//  WelcomeView.swift
//  PAEI
//
//  Created by Сергей on 08.01.2021.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var screenManager: ScreenManager
    @EnvironmentObject var conditionManager: СonditionManager
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                ScrollView {
                    LazyVStack {
                        if conditionManager.condition.isTestPassed {
                            Button(action: {
                                screenManager.isModalPresentResultView.toggle()
                                
                            }) {
                                Text("Последний результат теста")
                                    .bold()
                                    .setBlueStyleButton(color: .green)
                            }
//                            .padding()
                            .sheet(isPresented: $screenManager.isModalPresentResultView) {
                                NavigationView {
                                    ResultView(answer: conditionManager.condition.answer,
                                               isNewResult: false)
                                        .toolbar {
                                            
                                            ToolbarItem(placement: .navigationBarTrailing) {
                                                Button("Закрыть") {
                                                    screenManager.isModalPresentResultView = false
                                                }
                                            }
                                        }
                                }
                            }
                        }
                        
                     
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
//                            Text("В своей книге \"Идеальный руководитель\" Ицхак Адизес утверждает, что у менеджмента есть четыре функции, от успешной реализации которых зависит благополучие организации. Это производство результатов (P), администрирование (A), предпринимательство (E) и интеграция (I).")
                            Text("Доктор Ицхак Адизес, специалист в области управления и основатель компании Adizes Institute, разработал модель в начале 1970-х годов. С тех пор он применил ее к тысячам организаций по всему миру.")
                            
                        }
                        .setCustomBackgroung()
                        
                        Text("PAEI – это аббревиатура, которая описывает 4 управленческих роли (или стилей); выполнение каждой из них помогает команде или организации обеспечить максимально эффективную деятельность. Это:\n\n- Producer / Производитель;\n- Administrator / Администратор;\n- Entrepreneur / Предприниматель;\n- Integrator / Интегратор.")
                            .setCustomBackgroung()
                        
                        Text("Ни один человек не может одновременно выполнять все эти роли. Важно сделать так, чтобы всегда был кто-то, кто отвечает за каждую из них; тогда вы сможете построить сильную и эффективную команду менеджеров, которые выполняют свои обязанности и задачи.")
                            .setCustomBackgroung()
                        Text("Кроме того, вы можете использовать модель PAEI, чтобы узнать свои сильные и слабые стороны как лидера. Скорее всего, вы «тянетесь» к одному из этих стилей управления, и это абсолютно естественно. Когда вы знаете, какой из них подходит вам лучше всего, вы можете определить, какой из них вам следует избегать. Модель поможет выявить слабые места и пробелы в навыках, которые вы должны устранить.")
                            .setCustomBackgroung()
                        
                        
                        TextBlockView(imagaSystemName: "p.circle",
                                      title: "ЧТО НУЖНО СДЕЛАТЬ?",
                                      text: "Данная функция менеджмента отвечает за удовлетворение потребностей клиентов. От этого зависит результативность компании в краткосрочной перспективе.")
                        
                        TextBlockView(imagaSystemName: "a.circle",
                                      title: "КАК ЭТО НУЖНО СДЕЛАТЬ?",
                                      text: "Организация должна в правильной последовательности делать правильные вещи. Администратор обеспечивает данный процесс.")
                        
                        TextBlockView(imagaSystemName: "e.circle",
                                      title: "КОГДА/ЗАЧЕМ ЭТО НУЖНО СДЕЛАТЬ?",
                                      text: "Придерживаясь творческого подхода и готовность идти на риск менеджент также должен ориентироваться в хаосе изменений и определять направление развития компании.")
                        
                        TextBlockView(imagaSystemName: "i.circle",
                                      title: "КТО ЭТО ДОЛЖЕН СДЕЛАТЬ?",
                                      text: "Руководителю нужно уметь создавать в компании такую систему ценностей, которая в свою очередь сформирует в команде атмосферу взаимоуважения и сотрудничества.")
                        Spacer(minLength: 82)
                        
                    }
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                }
                .shadow(radius: 25)
                
               
                BlurButton(text: "Дальше") {screenManager.isShowingInstructionsView.toggle()}
                
                NavigationLink(
                    destination: InstructionsView(),
                    isActive: $screenManager.isShowingInstructionsView,
                    label: { EmptyView() }
                )
                
            }
            .navigationBarTitle("Модель PAEI")// 􀀣􀀅􀀍􀀕
    
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Модель PAEI")
//                        .multilineTextAlignment(.center)
//                }
//            }
        }
    }
}




struct TextBlockView: View {
    let imagaSystemName: String
//    let key: String
    let title: String
    let text: String
    var body: some View {
        VStack {
            Image(systemName: imagaSystemName)
                .font(.system(size: 100))
                .frame(height: 100)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            Text(title)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 4)
            Text(text)
        }
        .setCustomBackgroung()
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(СonditionManager())
            .environmentObject(ScreenManager())
    }
}


