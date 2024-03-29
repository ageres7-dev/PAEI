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
    @State private var isShareViewPresented: Bool = false
    @State private var showingActionSheet = false
    @State private var sharedContent: [Any] = []
    
    let answer: Answer
    let maxValueOneCharacteristic = 120
    var isNewResult = true
    
    var body: some View {
        ZStack {
            ResultBodyView(
                resultTest: resultTest,
                detailedResult: detailedResult,
                answer: answer,
                isNewResult: isNewResult,
                maxValueOneCharacteristic: maxValueOneCharacteristic
            )
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Ваш ключ: \(paeiKey)")
            .navigationBarTitleDisplayMode(.inline)
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Формат"), buttons: [
                    .default(Text("Текст")) {
                        sharedContent = sharedText
                        isShareViewPresented.toggle()
                    },
                    .default(Text("Документ PDF")) {
                        sharedContent = sharedPDF
                        isShareViewPresented.toggle()
                    },
                    .cancel()
                ])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button(action: {
                        showingActionSheet.toggle()
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .sheet(isPresented: $isShareViewPresented) {
                ActivityViewController(itemsToShare: sharedContent)
            }
            
            //MARK: - кнопка выхода
            if isNewResult {
                BlurButton(text: "Выход") {
                    screenManager.isModalPresentPassingTest = false
                    screenManager.isModalPresentResultView = false
                }
            }
        }
    }
}


extension ResultView {
    //MARK: - Properties
    private var sharedText: [Any] {
        var title = ""
        
        if let shortInfo = resultTest.shortInfo {
            title = "Я - \(shortInfo)\n\n"
        }
        
        var quality = ""
        if let qualities = resultTest.qualities {
            quality = "\nКачества:\n" + "- " + qualities.joined(separator: ", \n- ") + ".\n"
        }
        var characteristicString = ""
        
        if let characteristic = resultTest.characteristic {
            characteristicString = "Характеристика:\n" + characteristic + "\n"
        }
        var skillsString = ""
        if let skills = resultTest.skills {
            skillsString = "\nНавыки:\n" + "- " + skills.joined(separator: ", \n- ") + "." + "\n\n"
        }
         
         return [
            "\(title)Мой PAEI: \(paeiKey)\n\n\(characteristicString)\(quality)\(skillsString)Подробная расшифровка ключа: \(paeiKey)\n\nP=\(answer.producer)\n\(detailedResult.pCharacteristic)  \n\nA=\(answer.administrator)\n\(detailedResult.aCharacteristic) \n\nE=\(answer.entrepreneur)\n\(detailedResult.eCharacteristic) \n\nI=\(answer.integrator)\n\(detailedResult.iCharacteristic)"
         ]
        
    }
    
    private var sharedPDF: [Any] {
        var qualityString = ""
        if let qualities = resultTest.qualities {
            qualityString = "\nКачества:\n- \(qualities.joined(separator: ", \n- "))."
        }
        
        var skillsString = ""
        if let skills = resultTest.skills {
            skillsString = "\nНавыки:\n"  + "- " + skills.joined(separator: ", \n- ") + "." + "\n"
        }
                
        let titlePdf: String
        if let shortInfo = resultTest.shortInfo {
            titlePdf = "Я - \(shortInfo)"
        } else {
            titlePdf = "Мой PAEI: \(paeiKey)"
        }
        
        let subTitlePdf: String = resultTest.shortInfo != nil ? "Мой PAEI: \(paeiKey)\n\n" : ""
        
        var characteristicString: String?
        if let characteristic = resultTest.characteristic {
            characteristicString = subTitlePdf + "Характеристика:\n" + characteristic
        }
        
        let detailedCharacteristic = "Подробная расшифровка ключа: \(paeiKey)\n\nP=\(answer.producer)\n\(detailedResult.pCharacteristic)  \n\nA=\(answer.administrator)\n\(detailedResult.aCharacteristic) \n\nE=\(answer.entrepreneur)\n\(detailedResult.eCharacteristic) \n\nI=\(answer.integrator)\n\(detailedResult.iCharacteristic)"
        
        let image = UIImage(named: resultTest.lightPicture) ?? UIImage(systemName: "person.2.circle")!
        
        let pdfCreator = PDFCreator(title: titlePdf,
                                    characteristic: characteristicString,
                                    skills: skillsString,
                                    quality: qualityString,
                                    detailedCharacteristic: detailedCharacteristic,
                                    image: image)
        
        return [pdfCreator.createDocument()]
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
        
        //12 вопросов
        switch number {
        case 30...:
            characterForKey = characters.first ?? "😱"
        case 20..<30:
            characterForKey = characters.last ?? "😱"
        default:
            characterForKey = "-"
        }
        
        /*
        //10 вопросов
        switch number {
        case 26...:
            characterForKey = characters.first ?? "😱"
        case 20..<25:
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

struct ResultBodyView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var screenManager: ScreenManager
    @EnvironmentObject var conditionManager: СonditionManager
    let resultTest: Result
    let detailedResult: DetailedResult
    let answer: Answer
    let isNewResult: Bool
    let maxValueOneCharacteristic: Int

    var body: some View {
        ScrollView {
            LazyVStack{
                Image(colorScheme == .dark ? resultTest.darkPicture : resultTest.lightPicture)
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
                            .padding(.bottom, 4)
                        Text(characteristic)
                    }
                    .setCustomBackgroung()
                }
                //MARK: - Качества
                if  let qualities = resultTest.qualities {
                    VStack {
                        Text("Качества")
                            .bold()
                            .padding(.bottom, 4)
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
                            .padding(.bottom, 4)
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
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Производитель")
                                    .bold()
                                    .padding(.bottom, 4)
                                
                                CircleProgressBar(
                                    currentValue: answer.producer,
                                    maxValue: maxValueOneCharacteristic,
                                    insideLabel: "P = \(answer.producer)",
                                    fontValueIndex: 0.22,
                                    color: .paeiPink
                                )
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 8)
                            }
                            Spacer()
                        }
                        Text(detailedResult.pCharacteristic)
                    }
                    .setCustomBackgroung()
                    //MARK: - A
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Администратор")
                                    .bold()
                                    .padding(.bottom, 4)
                                
                                CircleProgressBar(
                                    currentValue: answer.administrator,
                                    maxValue: maxValueOneCharacteristic,
                                    insideLabel: "A = \(answer.administrator)",
                                    fontValueIndex: 0.22,
                                    color: .paeiOrange
                                )
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 8)
                            }
                            Spacer()
                        }
                        Text(detailedResult.aCharacteristic)
                    }
                    .setCustomBackgroung()
                    //MARK: - E
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Предприниматель")
                                    .bold()
                                    .padding(.bottom, 4)
                                
                                CircleProgressBar(
                                    currentValue: answer.entrepreneur,
                                    maxValue: maxValueOneCharacteristic,
                                    insideLabel: "E = \(answer.entrepreneur)",
                                    fontValueIndex: 0.22,
                                    color: .paeiBlue
                                )
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 8)
                            }
                            Spacer()
                        }
                        Text(detailedResult.eCharacteristic)
                    }
                    .setCustomBackgroung()
                    //MARK: - I
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Интегратор")
                                    .bold()
                                    .padding(.bottom, 4)
                                
                                CircleProgressBar(
                                    currentValue: answer.integrator,
                                    maxValue: maxValueOneCharacteristic,
                                    insideLabel: "I = \(answer.integrator)",
                                    fontValueIndex: 0.22,
                                    color: .paeiGreen
                                )
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 8)
                            }
                            Spacer()
                        }
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
                    .padding(.top, 16)
                }
                
                if isNewResult {
                    Spacer(minLength: 82)
                }
                
            }
            .padding(.bottom, 4)
            .padding()
        }
        .shadow(radius: 25)
    }
}


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        
        ResultView(answer: Answer())
            .preferredColorScheme(.dark)
            .environmentObject(ScreenManager())
            .environmentObject(СonditionManager())
    }
}
