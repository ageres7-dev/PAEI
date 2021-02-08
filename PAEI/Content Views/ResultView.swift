//
//  ResultView.swift
//  PAEI
//
//  Created by Сергей on 06.01.2021.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var screenManager: ScreenManager
    @EnvironmentObject var conditionManager: СonditionManager
    //    @Environment(\.colorScheme) private var colorScheme
    @State private var isShareViewPresented: Bool = false
    
    let answer: Answer
    var maxValueOneCharacteristic = 40
    var isNewResult = true
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack{
                    Image(resultTest.picture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: screenSize.width * 0.55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped()
                        .cornerRadius(20)
                    
                    if let shortInfo = resultTest.shortInfo {
                        Text("Вы – " + shortInfo)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                    }
                    //MARK: - Характеристика
                    if let characteristic = resultTest.characteristic {
                        VStack {
                            Text("Характеристика")
                                .bold()
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 4,
                                                    trailing: 0))
                            Text(characteristic)
                        }
                        .setCustomBackgroung()
                    }
                    //MARK: - Качества
                    if  let qualities = resultTest.qualities {
                        VStack {
                            Text("Качества")
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
                    //MARK: - Навыки
                    if let skills = resultTest.skills {
                        VStack {
                            Text("Навыки")
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
                    Group {
                        //MARK: - P
                        VStack {
                            Text("Производитель")
                                .bold()
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 4,
                                                    trailing: 0))
                            
                            CircleProgressBar(
                                currentValue: answer.producer,
                                maxValue: maxValueOneCharacteristic,
                                insideLabel: "P=\(pProcent)%",
                                fontValueIndex: 0.22,
                                color: .red
                            )
                            .frame(height: 100)
                            .padding(EdgeInsets(top: 0,
                                                leading: 0,
                                                bottom: 8,
                                                trailing: 0))
                            
                            Text(detailedResult.pCharacteristic)
                        }
                        .setCustomBackgroung()
                        //MARK: - A
                        VStack {
                            Text("Администратор")
                                .bold()
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 4,
                                                    trailing: 0))
                            
                            CircleProgressBar(
                                currentValue: answer.administrator,
                                maxValue: maxValueOneCharacteristic,
                                insideLabel: "A=\(aProcent)%",
                                fontValueIndex: 0.22
                            )
                            .frame(height: 100)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                            
                            Text(detailedResult.aCharacteristic)
                        }
                        .setCustomBackgroung()
                        //MARK: - E
                        VStack {
                            Text("Предприниматель")
                                .bold()
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 4,
                                                    trailing: 0))
                            
                            CircleProgressBar(
                                currentValue: answer.entrepreneur,
                                maxValue: maxValueOneCharacteristic,
                                insideLabel: "E=\(eProcent)%",
                                fontValueIndex: 0.22,
                                color: .yellow
                            )
                            .frame(height: 100)
                            .padding(EdgeInsets(top: 0,
                                                leading: 0,
                                                bottom: 8,
                                                trailing: 0))
                            
                            Text(detailedResult.eCharacteristic)
                        }
                        .setCustomBackgroung()
                        //MARK: - I
                        VStack {
                            Text("Интегратор")
                                .bold()
                                .padding(EdgeInsets(top: 0,
                                                    leading: 0,
                                                    bottom: 4,
                                                    trailing: 0))
                            
                            CircleProgressBar(
                                currentValue: answer.integrator,
                                maxValue: maxValueOneCharacteristic,
                                insideLabel: "I=\(iProcent)%",
                                fontValueIndex: 0.22,
                                color: .green
                            )
                            .frame(height: 100)
                            .padding(EdgeInsets(top: 0,leading: 0,bottom: 8,trailing: 0))
                            
                            Text(detailedResult.iCharacteristic)
                        }
                        .setCustomBackgroung()
                        
                    }
                    
                    //MARK: - Кнопка Удалить результат
                    if !isNewResult {
                        Button(action: {
                            screenManager.isModalPresentResultView.toggle()
                            DataManager.shared.clear(
                                conditionManager: conditionManager
                            )
                            
                        }) {
                            Text("Удалить результат")
                                .bold()
                                .setCustomStyleButton(color: .red)
                        }
                        .padding(EdgeInsets(top: 16,leading: 0,bottom: 0 ,trailing: 0))
                    }
                    
                    if isNewResult {
                        Spacer(minLength: 82)
                    }
                    
                }
                .padding(EdgeInsets(top: 0,leading: 0,bottom: 4 ,trailing: 0))
                .padding()
            }
            .shadow(radius: 25)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Ваш ключ: \(paeiKey)")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button(action: {
                        isShareViewPresented.toggle()
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .sheet(isPresented: $isShareViewPresented) {
                        ActivityViewController(itemsToShare: sharedContent)
                    }
                }
            }
            
            //MARK: - кнопка выхода
            if isNewResult {
                BlurButton(text: "Выход") {
                    screenManager.isModalPresentPassingTest.toggle()
                }
            }
        }
    }
}


extension ResultView {
    //MARK: - Properties
    
    
    private var sharedContent: [Any] {
        let title = resultTest.shortInfo != nil ? "Я - \(resultTest.shortInfo!)\n\n" : ""
        
        let qualit = resultTest.qualities != nil ? "\nКачества:\n" + "- " + resultTest.qualities!.joined(separator: ", \n- ") + ".\n" : ""
        
        let characteristic = resultTest.characteristic != nil ? "Характеристика:\n" + resultTest.characteristic! + "\n" : ""
        
        let skills = resultTest.skills != nil ? "\nНавыки:\n"  + "- " + resultTest.skills!.joined(separator: ", \n- ") + "." + "\n\n" : ""
        
        let text = "\(title)Мой PAEI: \(paeiKey)\n\n\(characteristic)\(qualit) \(skills)Подробная расшифрока ключа: \(paeiKey)\n\n P=\(pProcent)%\n\(detailedResult.pCharacteristic)  \n\nA=\(aProcent)%\n\(detailedResult.aCharacteristic) \n\nE=\(eProcent)%\n\(detailedResult.eCharacteristic) \n\nI=\(iProcent)%\n\(detailedResult.iCharacteristic)"

        
        return [
            UIImage(named: resultTest.picture) ?? UIImage(systemName: "person.2.circle") as Any,
            text]
    }
    
    private var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
    private var paeiKey: String{
        calculateResultKey(from: answer)
    }
    
    private var resultTest: Result {
        Result.getResult(text: paeiKey)
    }
    
    private var detailedResult: DetailedResult {
        DetailedResult.customPael(key: paeiKey)
    }
    
    private var pProcent: String {
        String(lround(Double(answer.producer) / Double(maxValueOneCharacteristic) * 100))
    }
    
    private var aProcent: String {
        String(lround(Double(answer.administrator) / Double(maxValueOneCharacteristic) * 100))
    }
    
    private var eProcent: String {
        String(lround(Double(answer.entrepreneur) / Double(maxValueOneCharacteristic) * 100))
    }
    
    private var iProcent: String {
        String(lround(Double(answer.integrator) / Double(maxValueOneCharacteristic) * 100))
    }
    
}


extension ResultView {
    private  func share() -> Void {
        
    }
    
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
        /*
        //12 вопросов
        switch number {
        case 31...:
            characterForKey = characters.first ?? "😱"
        case 24..<30:
            characterForKey = characters.last ?? "😱"
        default:
            characterForKey = "-"
        }
        */
        
        //10 вопросов
        switch number {
        case 26...:
            characterForKey = characters.first ?? "😱"
        case 20..<25:
            characterForKey = characters.last ?? "😱"
        default:
            characterForKey = "-"
        }
        
        
        //хз
        /*
        switch number {
        case 30...:
            characterForKey = characters.first ?? "😱"
        case 20..<30:
            characterForKey = characters.last ?? "😱"
        default:
            characterForKey = "-"
        }
        */
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
        
        ResultView(answer: Answer())
            .preferredColorScheme(.dark)
            .environmentObject(ScreenManager())
        
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


