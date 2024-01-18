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
    @State private var showSplash = true
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack(alignment: .trailing) {
                        if conditionManager.condition.isTestPassed {
                            Button(action: {
                                screenManager.isModalPresentResultView.toggle()
                            }) {
                                Text("Последний результат теста")
                                    .bold()
                                    .setCustomStyleButton(color: .green)
                            }
                        }
                     
                        VStack(alignment: .leading) {
                            HStack {
                                Image("pElement")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image("aElement")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image("eElement")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image("iElement")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .frame(height: 100)
                            .padding(.bottom, 8)
                            
                            Text("PAEI – это аббревиатура, которая описывает 4 управленческих роли, выполнение каждой из них помогает команде или организации обеспечить максимально эффективную деятельность. Это:\n\n- Producer / Производитель\n- Administrator / Администратор\n- Entrepreneur / Предприниматель\n- Integrator / Интегратор.")
                        }
                        .setCustomBackgroung()
                        
                        VStack(alignment: .leading) {
                            Text("Ни один человек не может одновременно выполнять все эти роли. Важно сделать так, чтобы всегда был кто-то, кто отвечает за каждую из них; тогда вы сможете построить сильную и эффективную команду менеджеров, которые выполняют свои обязанности и задачи.")
                                .padding(0)
                        }
                        .setCustomBackgroung()
                        
                        Text("Кроме того, вы можете использовать модель PAEI, чтобы узнать свои сильные и слабые стороны как лидера. Скорее всего, вы «тянетесь» к одному из этих стилей управления, и это абсолютно естественно. Когда вы знаете, какой из них подходит вам лучше всего, вы можете определить, какой из них вам следует избегать. Модель поможет выявить слабые места и пробелы в навыках, которые вы должны устранить.")
                            .padding(0)
                            .setCustomBackgroung()
                        
                        
                        Text("Модель PAEI разработал Ицхак Адизес (יצחק אדיג'ס‏‎) – израильский и американский писатель и бизнес-консультант, специализирующийся на улучшении эффективности менеджмента.\nОригинальный тест вы можете пройти на [сайте института Адизеса](https://adizes.me).")
                            .padding(0)
                        .setCustomBackgroung()
                        
                        Spacer(minLength: 82)
                    }
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                }
                .shadow(radius: 25)
                
                BlurButton(text: "Дальше") {
                    screenManager.isShowingInstructionsView.toggle()
                }
                
                NavigationLink(
                    destination: InstructionsView(),
                    isActive: $screenManager.isShowingInstructionsView,
                    label: { EmptyView() }
                )
                
            }
            .navigationBarTitle("Модель PAEI")
            .fullScreenCover(isPresented: $screenManager.isModalPresentPassingTest) {
                    PassingTest()
            }
            
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
    }
}


struct TextBlockView: View {
    let imagaSystemName: String
    let title: String
    let text: String
    var imageColor = Color.primary
    var body: some View {
        VStack {
            Image(systemName: imagaSystemName)
                .font(.system(size: 100))
                .frame(height: 100)
                .padding(.bottom, 8)
                .foregroundColor(imageColor)
            
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
