//
//  HomeScreen.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var contentViewModel = ContentViewModel()
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        ScrollView {
            ZStack {
                Color.color1
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    HStack {
                        HStack {
                            
                            Image(.search)
                                .padding(.all, 10)
                            
                            Text("Должность, ключевые слова")
                                .foregroundColor(.gray)
                                .padding(.all, 10)
                                .padding(.trailing,20)
                        }
                        .background(.color3)
                        .cornerRadius(10)
                        
                        Image(.setting)
                            .padding(.all, 10)
                            .background(.color3)
                            .cornerRadius(10)
                    }
                    .background(.color1)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            
                            VStack(alignment: .leading) {
                                
                                Image(.personBlue)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                Text("Вакансии рядом с вами")
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                
                                Image(.star)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    Text("Поднять резюме в поиске")
                                    Text("Поднять")
                                        .foregroundStyle(.green)
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                
                                Image(.blank)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                Text("Временная работа и подработка")
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                
                                Image(.heartBlue)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                Text("Полезные статьи и советы")
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                        }
                    }
                    
                    Text("Вакансии для вас")
                        .padding(.leading, 10)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 25, weight: .bold))
                    
                    
                    ForEach(contentViewModel.data, id: \.self) { vacancies in
                        ContentViewVacancies(vacancies: vacancies, selected: $selected)
                    }
                }
            }
            .foregroundStyle(.white)
            .sheet(isPresented: $isNext) {
                Input()
            }
        }
        .background(.color1)
    }
}
