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
    @Environment(\.colorScheme) private var colorScheme
    
    let answer: Answer
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVStack{
                    Group{
                        Text("Вы – " + resultTest.shortInfo)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                        
                        Image(resultTest.picture)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: screenSize.height * 0.28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                            .cornerRadius(20)
                        
                        CircleGraph(
                            pValue: answer.producer,
                            aValue: answer.administrator,
                            eValue: answer.entrepreneur,
                            iValue: answer.integrator
                        )
                        .frame( height: screenSize.width / 3.6)
                        
                        
                        Text(resultTest.characteristic)
                            .setCustomBackgroung()
                        
                        if resultTest.qualities.count != 0 {
                            VStack {
                                Text("Качества:")
                                    .bold()
                                HStack {
                                    VStack(alignment: .leading){
                                        ForEach(resultTest.qualities, id: \.self) {quality in
                                            Text("– \(quality)")
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            .setCustomBackgroung()
                        }
                        if resultTest.skills.count != 0 {
                            VStack {
                                Text("Навыки:")
                                    .bold()
                                HStack {
                                    VStack(alignment: .leading){
                                        ForEach(resultTest.skills, id: \.self) {quality in
                                            Text("– \(quality)")
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            .setCustomBackgroung()
                        }
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4 , trailing: 0))
                    
                    .shadow(color: shadowColor.opacity(0.5), radius: 25, x: 0, y: 0)
                }
                //                .shadow(radius: 10)
                .padding()
            }
            
            Button(action: {
                modalState.isModalPresentPassingTest = false
            }) {
                Text("Выход")
                    .bold()
                    .setBlueStyleButton()
            }
            .padding()
            
            .navigationBarBackButtonHidden(true)
            .navigationTitle(paeiKey)
//            .navigationBarItems(leading:
//                                    Button("Выход") {
//                                        modalState.isModalPresentPassingTest = false
//                                    }
//                                , trailing:
//                                    Button(action: {}, label: {
//                                        Image(systemName: "square.and.arrow.up")
//                                    })
//            )
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Выход") {
                        modalState.isModalPresentPassingTest = false
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                
            }
            
        }
        
    }
    
    
}


extension ResultView {
    
    private var paeiKey: String{
        calculateResultKey(from: answer)
    }
    
    private var resultTest: Result {
        Result.getResult(text: paeiKey)
    }
    
    private var shadowColor: Color {
        colorScheme == .dark ? .blue : .gray
    }

}


extension ResultView {
    //MARK: - Расчет ключа paei
    private func calculateResultKey(from answer: Answer) -> String {
        var paelKey = ""
      
        paelKey += identify(characters: ["P", "p"], from: answer.producer)
        paelKey += identify(characters: ["A", "a"], from: answer.administrator)
        paelKey += identify(characters: ["E", "e"], from: answer.entrepreneur)
        paelKey += identify(characters: ["I", "i"], from: answer.integrator)
        
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

/*
struct TextBlock: View {
    @Environment(\.colorScheme) private var colorScheme
    let text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(colorScheme == .dark ? .customGray : .white)
//                .shadow(color: shadowColor.opacity(0.5), radius: 25, x: 0, y: 0)
            
            Text(text)
                .padding()
        }
    }
    
    private var shadowColor: Color {
        colorScheme == .dark ? .blue : .gray
    }
}
*/


struct CircleGraph: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let pValue: Int
    let aValue: Int
    let eValue: Int
    let iValue: Int
    //    let height: CGFloat
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(colorScheme == .dark ? .customGray : .white)
            //                .foregroundColor(colorScheme == .dark ? .customGray : .red)
            
            GeometryReader { geometry in
                HStack {
                    CircleProgressBar(
                        currentValue: pValue,
                        maxValue: 48,
                        insideLabel: "P=\(pValue)"
                    )
                    Spacer(minLength: 16)
                    CircleProgressBar(
                        currentValue: aValue,
                        maxValue: 48,
                        insideLabel: "A=\(aValue)"
                    )
                    Spacer(minLength: 16)
                    CircleProgressBar(
                        currentValue: eValue,
                        maxValue: 48,
                        insideLabel: "E=\(eValue)"
                    )
                    Spacer(minLength: 16)
                    CircleProgressBar(
                        currentValue: iValue,
                        maxValue: 48,
                        insideLabel: "I=\(iValue)"
                    )
                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}



struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(answer: Answer())
            .preferredColorScheme(.dark)
            .environmentObject(ModalStateManager())
    }
}
/*
struct TextBlock_Previews: PreviewProvider {
    static var previews: some View {
        TextBlock(text: "hinkjnkn")
    }
}
*/
struct CircleGraph_Previews: PreviewProvider {
    static var previews: some View {
        CircleGraph(pValue: 23, aValue: 21, eValue: 2, iValue: 40)
            .frame(width: 400, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}


//resultTest.characteristic




/*
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
 
 */


