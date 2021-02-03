//
//  InstructionsView.swift
//  PAEI
//
//  Created by Сергей on 22.01.2021.
//

import SwiftUI

struct InstructionsView: View {
    @EnvironmentObject var modalState: ScreenManager
    
    @State private var isShowingResultView = false
    
    var body: some View {
        ZStack {
            ScrollView {
                    LazyVStack {
                       
                        Image("default")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: screenSize.width * 0.55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                            .cornerRadius(20)
                        
                        VStack {
                            
                            /*
                            Image(systemName: "book")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height * 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 40, trailing: 0))
                            */
//                            Text("Оцените Ваши личные качества – КАКОЙ Я? \nБудьте внимательны, описывайте себя, а не Вашу работу. Расставьте оценки от 1 (наименее подходящая для меня характеристика) до 4 баллов (наиболее подходящая). \nЧем меньше балл, тем  менее выражено качество. В сумме должно получиться 10 баллов в каждом.")
                                //                        Text("Необходимо ответить на 12 блоков, содержащие по 4 качества личности. Присвойте каждому качеству от 1-го до 4-ех баллов в зависимости от того, насколько оно подходит именно вам. Общая сумма баллов одного блока должна быть равна 10. И да, будьте честны перед собой")
                            Text("Оцените Ваши личные качества – КАКОЙ Я? Необходимо ответить на 12 блоков, содержащие по 4 качества личности. Присвойте каждому качеству от 1-го до 4-ех баллов в зависимости от того, насколько оно подходит именно вам. Общая сумма баллов одного блока должна быть равна 10.")
                        }
                        .setCustomBackgroung()
                        
                        Spacer(minLength: 82)
                        
                    }
                    .padding()
                
            }
            .shadow(radius: 25)
            
            BlurButton(text: "Начать тест") {
                modalState.isModalPresentPassingTest.toggle()
                modalState.isShowingInstructionsView.toggle()
            }
//
//            Button(action: {
//                modalState.isModalPresentPassingTest.toggle()
//                modalState.isShowingInstructionsView.toggle()
//
//            }) {
//                Text("Начать тест")
//                    .bold()
//                    .setCustomStyleButton()
//            }
//            .padding()
            .fullScreenCover(
                isPresented: $modalState.isModalPresentPassingTest,
                content: PassingTest.init
            )
//            .sheet(isPresented: $screenManager.isModalPresentPassingTest, content: {
//                PassingTest()
//            })
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Инструкция")
    }
}



extension InstructionsView {
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
