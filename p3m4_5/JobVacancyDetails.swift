//
//  ContentViewVacanciesTest.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 01.04.2024.
//

import SwiftUI

struct JobVacancyDetails: View {
    var vacancies: Vacancies
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.color1
                        .ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(vacancies.title ?? "")
                        Text(vacancies.salary.full ?? "")
                        Text("Требуемый опыт: от \(vacancies.experience.text ?? "")")
                        ForEach(vacancies.schedules ?? [], id: \.self) { schedules in
                            Text(schedules)
                        }
                        
                        HStack {
                            HStack {
                                Text("\(vacancies.appliedNumber ?? 0) человек уже откликнулись")
                                    .padding()
                                
                                Image(.personGreen)
                            }
                            .background(.color5)
                            
                            HStack{
                                Text("\(vacancies.lookingNumber ?? 0) человека сейчас смотрят")
                                    .padding()
                                
                                Image(.eyeGreen)
                            }
                            .background(.color5)
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(vacancies.company ?? "")
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
                            
                            Text("\(vacancies.address.town ?? ""), \(vacancies.address.street ?? ""), \(vacancies.address.house ?? "")")
                                .padding(.leading, 20)
                                .padding(.bottom, 20)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(.color2)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text(vacancies.description ?? "")
                            
                            Text("Ваши задачи")
                                .font(.title)
                                .bold()
                            
                            Text(vacancies.responsibilities ?? "")
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Задайте вопрос работодателю")
                                    .bold()
                                Text("Он получит его с откликом на вакансию")
                                    .foregroundColor(.gray)
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                Questions(vacancies: vacancies)
                            }
                            
                            Button {
                                if isNext {
                                    isNext.toggle()
                                } else {
                                    
                                }
                            } label: {
                                Text("Откликнуться")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                    .font(.system(size: 16, weight: .bold))
                                    .background(.green)
                                    .cornerRadius(50)
                            }
                        }
                    }
                }
                .foregroundStyle(.white)
            }
            .background(.color1)
        }
    }
}

