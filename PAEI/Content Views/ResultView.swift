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

extension ResultView {
    //MARK: - Расчет ключа paei
    private func calulateResultTest(from answer: Answer) -> String {
        var result = ""
        
        result += identifyFrom(characters: ["P", "p"], and: answer.producer)
        result += identifyFrom(characters: ["A", "a"], and: answer.administrator)
        result += identifyFrom(characters: ["E", "e"], and: answer.entrepreneur)
        result += identifyFrom(characters: ["I", "i"], and: answer.integrator)
        
        return result
    }
    
    //MARK: - Логика определения буквы для ключа pael
    private func identifyFrom(characters: [String], and number: Int) -> String {
        var result = ""
        
        assert(characters.count == 2, "Передан неверный массив")
        
        switch number {
        case 30...:
            result = characters.first ?? "😱"
        case 20..<30:
            result = characters.last ?? "😱"
        default:
            result = "-"
        }
        
        return result
    }
    //MARK: - Вытаскиваем нужный символ из строки
    private func getСharacter(number: Int, from string: String) -> String {
        let index = string.index(string.startIndex, offsetBy: number)
        return String(string[index])
    }
    
}



struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(answers: [Answer()])
    }
}
