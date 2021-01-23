//
//  DataManager.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//
import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("answer") var userData = Data()
    
    private init() {}
    
    let qualityOfProducers = [
        "Вовлеченный", "Прямолинейный", "Делающий",
        "Отдающий себе отчет", "Результативный", "Упорный",
        "Активный", "Прагматичный", "Побеждающий",
        "Рациональный", "Деловой", "Реалистичный"
    ]
    
    let qualityOfAdministrators = [
        "Сомневающийся", "Анализирующий", "Созерцающий",
        "Оценивающий", "Логичный", "Консервативный",
        "Наблюдающий", "Размышляющий", "Точный",
        "Сдержанный", "Аккуратный", "Осторожный"
    ]
    
    let qualityOfEntrepreneurs = [
        "Яркий", "Харизматичный", "Провоцирующий",
        "Идущий на риск", "Задающий вопросы", "Радикальный",
        "Абстрактный", "Смотрящий в будущее", "Концептуальный",
        "Генерирующий идеи", "Яркий", "Мечтающий"
    ]
    
    let qualityOfIntegrators = [
        "Отзывчивый", "Чувствующий", "Сопереживающий",
        "Благожелательный", "Интуитивный", "Общительный",
        "Взаимодействующий", "Теплый", "Стремящийся к консенсусу",
        "Осведомленный", "Приятный", "Объединяющий"
    ]
    
    
}



extension DataManager {
    func save(condition: Сondition) {
        guard let userData = try? JSONEncoder().encode(condition) else { return }
        self.userData = userData
    }
    
    func loadCondition() -> Сondition {
        guard let condition = try? JSONDecoder().decode(Сondition.self, from: userData) else { return Сondition() }
        return condition
        
//        try? JSONDecoder().decode(Answer.self, from: userData)
        
        
    }
    
    func clear(conditionManager: СonditionManager) {
        conditionManager.condition.answer = Answer()
        conditionManager.condition.isTestPassed = false
        UserDefaults.standard.removeObject(forKey: "answer")
    }
}
