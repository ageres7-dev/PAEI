//
//  Question.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.


//

struct Сharacteristic {
    let firstLine: String
    let secondLine: String
    let thirdLine: String
    let fourthLine: String
}

extension  Сharacteristic {
    static func getCharacteristic() -> [Сharacteristic] {
        return [
            Сharacteristic(firstLine: "Вовлеченный",
                            secondLine: "Яркий",
                            thirdLine: "Отзывчивый",
                            fourthLine: "Вовлеченный"),
            
            Сharacteristic(firstLine: "Харизматичный",
                            secondLine: "Чувствующий",
                            thirdLine: "Анализирующий",
                            fourthLine: "Прямой"),
            
            Сharacteristic(firstLine: "Сопереживающий",
                            secondLine: "Созерцающий",
                            thirdLine: "Думающий",
                            fourthLine: "Делающий"),
            
            Сharacteristic(firstLine: "Идущий на риск",
                            secondLine: "Отдающий себе отчет",
                            thirdLine: "Оценивающий",
                            fourthLine: "Благожелательный"),
            
            Сharacteristic(firstLine: "Логичный",
                            secondLine: "Задающий вопросы",
                            thirdLine: "Эффективный",
                            fourthLine: "Интуитивный"),
            
            Сharacteristic(firstLine: "Взаимодействующий",
                            secondLine: "Активный",
                            thirdLine: "Абстрактный",
                            fourthLine: "Наблюдающий"),
            
            Сharacteristic(firstLine: "Ориентированный на будущее",
                            secondLine: "Теплый",
                            thirdLine: "Прагматичный",
                            fourthLine: "Размышляющий"),
            
            Сharacteristic(firstLine: "Стремящийся к консенсусу",
                            secondLine: "Концептуальный",
                            thirdLine: "Наблюдающий",
                            fourthLine: "Побеждающий"),
            
            Сharacteristic(firstLine: "Осведомленный",
                            secondLine: "Сдержанный",
                            thirdLine: "Рациональный",
                            fourthLine: "Генерирующий идеи"),
            
            Сharacteristic(firstLine: "Приятный",
                            secondLine: "Аккуратный, точный",
                            thirdLine: "Яркий, выделяющийся",
                            fourthLine: "Деловой, серьезный")
        ]
    }
}
