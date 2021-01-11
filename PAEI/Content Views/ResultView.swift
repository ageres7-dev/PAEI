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
        
       
            Form {
      
//                    Text(paeiKey)
//                        .bold()
//                        .font(.title)
                    
                    Image(resultTest.picture)
//                        .resizable()
//                                .scaledToFill()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                        .frame(width: 200, height: 200)
                    
                    Spacer()
                    Text("\(resultTest.shortInfo)")
                        .bold()
                        
                        .padding()
                    
                    
                    Text("\(Text("\(resultTest.characteristic)"))")
                    Spacer()
                    
                Spacer()
                Button(action: {
                    modalState.isModalPresentPassingTest = false
                }) {
                    Text("Выход")
                        .bold()
                        .setBlueStyleButton()
                }
                
                .navigationTitle(paeiKey)
            }

        }
        
    
}

extension ResultView {
    
    var paeiKey: String{
        calculateResultTest(from: answers)
    }
    
    var resultTest: Result {
        Result.getResult(text: paeiKey)
    }
}


extension ResultView {
    //MARK: - Расчет ключа paei
    private func calculateResultTest(from answers: [Answer]) -> String {
        var paelKey = ""
        var pointsAccumulated: (p: Int, a: Int, e: Int, i:Int) = (0, 0, 0, 0)
        
        answers.forEach { answer in
            pointsAccumulated.p += answer.producer
            pointsAccumulated.a += answer.administrator
            pointsAccumulated.e += answer.entrepreneur
            pointsAccumulated.i += answer.integrator
        }
      
        paelKey += identify(characters: ["P", "p"], from: pointsAccumulated.p)
        paelKey += identify(characters: ["A", "a"], from: pointsAccumulated.a)
        paelKey += identify(characters: ["E", "e"], from: pointsAccumulated.e)
        paelKey += identify(characters: ["I", "i"], from: pointsAccumulated.i)
        
        return paelKey
    }
    
    //MARK: - Логика определения буквы для ключа pael
    private func identify(characters: [String], from number: Int) -> String {
        var characterForKey = ""
        
        assert(characters.count == 2, "Передан неверный массив")
        
        switch number {
        case 30...:
            characterForKey = characters.first ?? "😱"
        case 20..<30:
            characterForKey = characters.last ?? "😱"
        default:
            characterForKey = "-"
        }
        
        return characterForKey
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
            .environmentObject(ModalStateManager())
    }
}


