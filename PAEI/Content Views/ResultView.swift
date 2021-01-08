//
//  ResultView.swift
//  PAEI
//
//  Created by Сергей on 06.01.2021.
//

import SwiftUI

struct ResultView: View {
//    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modalState: ModalStateManager
    
    let answers: [Answer]
    
    var body: some View {
        
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Text("\(totalFrom(answers: answers).producer)")
                
                Button("Выход") {
    //                presentationMode.wrappedValue.dismiss()
//                    modalState.isModalPresentResultView = false
                    modalState.isModalPresentPassingTest = false
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
}

extension ResultView {
    private func totalFrom(answers: [Answer]) -> Answer {
        var producer = 0
        var administrator = 0
        var entrepreneur = 0
        var integrator = 0
        
        answers.forEach { answer in
            producer += answer.producer
            administrator += answer.administrator
            entrepreneur += answer.entrepreneur
            integrator += answer.integrator
        }
        return Answer(producer: producer,
                      administrator: administrator,
                      entrepreneur: entrepreneur,
                      integrator: integrator)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(answers: [Answer()])
    }
}
