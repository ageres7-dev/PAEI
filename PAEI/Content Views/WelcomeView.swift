//
//  WelcomeView.swift
//  PAEI
//
//  Created by Сергей on 08.01.2021.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var modalState: ModalStateManager
    //    @State private var isPresentPassingTest = false
    
    var body: some View {
        
        VStack {
            
            Form {
                
                HStack(alignment: .top) {
                    Text("P")
                        .bold()
                        .font(.system(size: 100))
                        .offset(y: -15)
                        .frame(minWidth: 70)
                    
                    Text("ЧТО НУЖНО СДЕЛАТЬ? \n\nДанная функция менеджмента отвечает за удовлетворение потребностей клиентов. От этого зависит результативность компании в краткосрочной перспективе.")
                }
                HStack(alignment: .top) {
                    Text("A")
                        .bold()
                        .font(.system(size: 100))
                        .offset(y: -15)
                        .frame(minWidth: 70)
                    
                    Text("КАК ЭТО НУЖНО СДЕЛАТЬ? \n\nОрганизация должна в правильной последовательности делать правильные вещи. Администратор обеспечивает данный процесс.")
                }
                
                HStack(alignment: .top) {
                    Text("E")
                        .bold()
                        .font(.system(size: 100))
                        .offset(y: -15)
                        .frame(minWidth: 70)
                    
                    Text("КОГДА/ЗАЧЕМ ЭТО НУЖНО СДЕЛАТЬ? \nПридерживаясь творческого подхода и готовность идти на риск менеджент также должен ориентироваться в хаосе изменений и определять направление развития компании.")
                }
                
                HStack(alignment: .top) {
                    Text("I")
                        .bold()
                        .font(.system(size: 100))
                        .offset(y: -15)
                        .frame(minWidth: 70)
                    
                    Text("КТО ЭТО ДОЛЖЕН СДЕЛАТЬ? \n\nРуководителю нужно уметь создавать в компании такую систему ценностей, которая в свою очередь сформирует в команде атмосферу взаимоуважения и сотрудничества.")
                }
            }
            
        }
        
        
        
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
        
    }
    
    
    
    
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
