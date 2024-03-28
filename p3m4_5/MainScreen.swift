//
//  MainScreen.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct MainScreen: View {
    @State var email = ""
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    Color.color1
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        
                        Text("Вход в личный кабинет")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                        Spacer(minLength: 100)
                        
                        // MARK: - Первый стек
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Text("Поиск работы")
                                .font(.system(size: 16, weight: .bold))
                            
                            HStack {
                                
                                Image(.letter)
                                    .padding(.all, 10)
                                
                                TextField("Электронная почта или телефон", text: $email)
                                    .foregroundColor(.gray)
                                
                            }
                            .background(.color3)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .shadow(color: .color1, radius: 10)
                            
                            HStack{
                                
                                Button {
                                    if email == "1" {
                                        isNext.toggle()
                                    }
                                } label: {
                                    Text("Продолжить")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .background(.blue)
                                        .cornerRadius(10)
                                }
                                
                                Button {
                                    if isNext {
                                        isNext.toggle()
                                    } else {
                                        
                                    }
                                } label: {
                                    Text("Войти с паролем")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.blue)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
                        .padding(.bottom, 60)
                        .background(.color2)
                        .cornerRadius(20)
                        
                        // MARK: - Второй стек
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Поиск сотрудников")
                                    .font(.system(size: 16, weight: .bold))
                                
                                Text("Размещение вакансий и доступ к базе резюме")
                                    .font(.system(size: 14, weight: .regular))
                            }
                            Button {
                                if isNext {
                                    isNext.toggle()
                                } else {
                                    
                                }
                            } label: {
                                Text("Я ищу сотрудников")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 30)
                                    .font(.system(size: 16, weight: .bold))
                                    .background(.green)
                                    .cornerRadius(50)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 24)
                        .background(.color2)
                        .cornerRadius(20)
                        
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
}
