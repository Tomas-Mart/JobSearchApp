//
//  ContentViewModel.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 20.03.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    let service = Service()
    let maimJson = "main"
    @Published var data = [Vacancies]()
    init(){
        getAllVacancies()
    }
    
    private func getAllVacancies() {
        service.loadJson(filename: maimJson) { vacancie in
            self.data = vacancie
        }
    }
    
    static let preview: Vacancies = .init(
        lookingNumber: 145,
        title: "UI/UX Designer",
        address: Address(town: "Минск", street: "Бирюзова", house: "4/5"),
        company: "Мобирикс",
        experience: Experience(previewText: "Amina", text: "1 года до 3 лет"),
        publishedDate: "Amina",
        isFavorite: true,
        salary: Salary(full: "Уровень дохода не указан"),
        schedules: ["Полная занятость, полный день"],
        appliedNumber: 33,
        description: "MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов.",
        responsibilities: "-Проектировать пользовательский опыт, проводить UX исследования; -Разрабатывать адаптивный дизайн интерфейса для мобильных приложений; -Разрабатывать быстрые прототипы для тестирования идеи дизайна и их последующая; интеграция на основе обратной связи от команды и пользователей; -Взаимодействовать с командой разработчиков для обеспечения точной реализации ваших дизайнов; -Анализ пользовательского опыта и адаптация под тренды.",
        questions: ["Какой график работы?", "Какая оплата труда?"]
    )
}
