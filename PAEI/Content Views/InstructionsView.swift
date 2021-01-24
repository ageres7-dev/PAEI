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
        VStack {
            ScrollView {
                    LazyVStack {
                        
                        Image(systemName: "book")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: screenSize.height * 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                        //                        .cornerRadius(20)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 40, trailing: 0))
                        
                        Text("Оцените Ваши личные качества – КАКОЙ Я? \nБудьте внимательны, описывайте себя, а не Вашу работу. Расставьте оценки от 1 (наименее подходящая для меня характеристика) до 4 баллов (наиболее подходящая). \nЧем меньше балл, тем  менее выражено качество. В сумме должно получиться 10 баллов в каждом.")
                            //                        Text("Необходимо ответить на 12 блоков, содержащие по 4 качества личности. Присвойте каждому качеству от 1-го до 4-ех баллов в зависимости от того, насколько оно подходит именно вам. Общая сумма баллов одного блока должна быть равна 10. И да, будьте честны перед собой")
                    }
                    .setCustomBackgroung()
                    .padding()
                
            }
            .shadow(radius: 25)
            

            Button(action: {
                modalState.isModalPresentPassingTest.toggle()
                modalState.isShowingInstructionsView.toggle()
                
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
        }
        .navigationBarTitleDisplayMode(.inline)
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
