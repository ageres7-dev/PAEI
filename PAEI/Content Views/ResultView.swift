//
//  ResultView.swift
//  PAEI
//
//  Created by Сергей on 06.01.2021.
//

import SwiftUI

struct ResultView: View {
    //    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modalState: ScreenManager
    @Environment(\.colorScheme) private var colorScheme
    
    var isNewResult = true
    let answer: Answer
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        
//        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack{
                        Group{
                           
                            Image(resultTest.picture)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: screenSize.width * 0.55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(20)
                            /*
                            CircleGraph(
                                pValue: answer.producer,
                                aValue: answer.administrator,
                                eValue: answer.entrepreneur,
                                iValue: answer.integrator
                            )
                            .frame( height: screenSize.width / 3.6)
                            */
                            
                            if let shortInfo = resultTest.shortInfo {
                                Text("Вы – " + shortInfo)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .font(.largeTitle)
                            }
                            
                            if let characteristic = resultTest.characteristic {
                                
                                VStack {
                                    Text("Характеристика:")
                                        .bold()
                                        .padding(EdgeInsets(top: 0,
                                                            leading: 0,
                                                            bottom: 4,
                                                            trailing: 0))
                                    Text(characteristic)
                                }
                                .setCustomBackgroung()
                            }
                            
                            if  let qualities = resultTest.qualities {
                                VStack {
                                    Text("Качества:")
                                        .bold()
                                        .padding(EdgeInsets(top: 0,
                                                            leading: 0,
                                                            bottom: 4,
                                                            trailing: 0))
                                    HStack {
                                        VStack(alignment: .leading){
                                            ForEach(qualities, id: \.self) {quality in
                                                Text("– \(quality)")
                                                    .multilineTextAlignment(.leading)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                                .setCustomBackgroung()
                            }
                            if let skills = resultTest.skills {
                                VStack {
                                    Text("Навыки:")
                                        .bold()
                                        .padding(EdgeInsets(top: 0,
                                                            leading: 0,
                                                            bottom: 4,
                                                            trailing: 0))
                                    HStack {
                                        VStack(alignment: .leading){
                                            ForEach(skills, id: \.self) {quality in
                                                Text("– \(quality)")
                                                    .multilineTextAlignment(.leading)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                                .setCustomBackgroung()
                            }
                            
                            VStack {
                                CircleProgressBar(
                                    currentValue: answer.producer,
                                    maxValue: 48,
                                    insideLabel: "P=\(answer.producer)"
                                )
                                .frame(height: 100)
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 8,
                                                    trailing: 0))
                                
                                Text(detailedResult.pCharacteristic)
                            }
                            .setCustomBackgroung()
                            
                            VStack {
                                CircleProgressBar(
                                    currentValue: answer.administrator,
                                    maxValue: 48,
                                    insideLabel: "A=\(answer.administrator)"
                                )
                                .frame(height: 100)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                                
                                Text(detailedResult.aCharacteristic)
                            }
                            .setCustomBackgroung()
                            
                            VStack {
                                CircleProgressBar(
                                    currentValue: answer.entrepreneur,
                                    maxValue: 48,
                                    insideLabel: "E=\(answer.entrepreneur)"
                                )
                                .frame(height: 100)
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 8,
                                                    trailing: 0))
                                
                                Text(detailedResult.eCharacteristic)
                            }
                            .setCustomBackgroung()
                            
                            VStack {
                                CircleProgressBar(
                                    currentValue: answer.integrator,
                                    maxValue: 48,
                                    insideLabel: "I=\(answer.integrator)"
                                )
                                .frame(height: 100)
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 8,
                                                    trailing: 0))
                                
                                Text(detailedResult.iCharacteristic)
                            }
                            .setCustomBackgroung()
                            
                        }
                        .padding(EdgeInsets(top: 0,
                                            leading: 0,
                                            bottom: 4 ,
                                            trailing: 0))
                        .shadow(color: shadowColor.opacity(0.5), radius: 25, x: 0, y: 0)
                    }
                    .padding()
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Ваш ключ: \(paeiKey)")
                /*
                .navigationBarItems(leading:
                                        Button("Выход") {
                                            modalState.isModalPresentPassingTest = false
                                        }
                                    , trailing:
                                        Button(action: {}, label: {
                                            Image(systemName: "square.and.arrow.up")
                                        })
                )
                */
                .toolbar {
                    
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button("Выход") {
//                            modalState.isModalPresentPassingTest = false
//                            modalState.isModalPresentResultView = false
//                        }
//                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
                
                
                if isNewResult {
                    Button(action: {
                        modalState.isModalPresentPassingTest = false
                        modalState.isModalPresentResultView = false
                    }) {
                        Text("Выход")
                            .bold()
                            .setBlueStyleButton()
                    }
                    .padding()
                }
                

            }
//        }
//        .navigationBarHidden(true)
    }
}


extension ResultView {
    //MARK: - Properties
    private var paeiKey: String{
        calculateResultKey(from: answer)
    }
    
    private var resultTest: Result {
        Result.getResult(text: paeiKey)
    }
    
    private var detailedResult: DetailedResult {
        DetailedResult.customPael(key: paeiKey)
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





struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResultView(answer: Answer())
                .preferredColorScheme(.dark)
                .environmentObject(ScreenManager())
            ResultView(answer: Answer())
                .preferredColorScheme(.dark)
                .environmentObject(ScreenManager())
        }
    }
}
/*
struct TextBlock_Previews: PreviewProvider {
    static var previews: some View {
        TextBlock(text: "hinkjnkn")
    }
}
*/



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


