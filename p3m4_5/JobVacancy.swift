//
//  JobVacancy.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct JobVacancy: View {
    var vacancies: Vacancies
    @Binding var selected: Int
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.color1
                        .ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("UI/UX Designer")
                        Text("Уровень дохода не указан")
                        Text("Требуемый опыт: от 1 года до 3 лет")
                        Text("Полная занятость, полный день")
                        
                        HStack {
                            HStack {
                                Text("147 человек уже откликнулись")
                                    .padding()
                                
                                Image(.personGreen)
                            }
                            .background(.color5)
                            
                            HStack{
                                Text("2 человека сейчас смотрят")
                                    .padding()
                                
                                Image(.eyeGreen)
                            }
                            .background(.color5)
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Мобирикс")
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                
                                Image(.mark)
                                    .padding(.leading, 5)
                                    .padding(.top, 20)
                            }
                            Image(.map)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 100)
                                .padding(.horizontal)
                            
                            Text("Минск, улица Бирюзова, 4/5")
                                .padding(.leading, 20)
                                .padding(.bottom, 20)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(.color2)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов.")
                            
                            Text("Ваши задачи")
                                .font(.title)
                                .bold()
                            
                            Text("-Проектировать пользовательский опыт, проводить UX исследования; -Разрабатывать адаптивный дизайн интерфейса для мобильных приложений; -Разрабатывать быстрые прототипы для тестирования идеи дизайна и их последующая; интеграция на основе обратной связи от команды и пользователей; -Взаимодействовать с командой разработчиков для обеспечения точной реализации ваших дизайнов; -Анализ пользовательского опыта и адаптация под тренды.")
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Задайте вопрос работодателю")
                                    .bold()
                                Text("Он получит его с откликом на вакансию")
                                    .foregroundColor(.gray)
                            }
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Text("UI/UX Designer")
                                    .padding()
                                    .background(.color3)
                                    .clipShape(.capsule)
                                
                                Text("Уровень дохода не указан")
                                    .padding()
                                    .background(.color3)
                                    .clipShape(.capsule)
                                
                                Text("Требуемый опыт: от 1 года до 3 лет")
                                    .padding()
                                    .background(.color3)
                                    .clipShape(.capsule)
                                
                                Text("Полная занятость, полный день")
                                    .padding()
                                    .background(.color3)
                                    .clipShape(.capsule)
                                
                                Questions(vacancies: vacancies)
                            }
                        }
                    }
                }
                .foregroundStyle(.white)
                
                Spacer(minLength: 90)
                
            }
            .background(.color1)
        }
    }
}
