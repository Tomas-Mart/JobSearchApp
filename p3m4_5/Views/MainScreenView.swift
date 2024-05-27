//
//  MainScreen.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct MainScreenView: View {
    @State private var email = ""
    @State private var isEmailValid = false
    @State private var isNext = false
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
                                
                                TextField("", text: $email, prompt: Text("Электронная почта или телефон").foregroundColor(.gray))
                                .onReceive(email.publisher.collect()) { text in
                                    self.isEmailValid = self.validateEmail(email: "\(text)")
                                }
                                .overlay(Button(action: {
                                    self.email = ""
                                }) {
                                    if !self.email.isEmpty {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.trailing, 15), alignment: .trailing)
                                .disabled(!isEmailValid)
                            }
                            .background(.color3)
                            .cornerRadius(10)
                            .shadow(color: .color1, radius: 10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: isEmailValid ? 0 : 2))
                            
                            HStack{
                                Button {
                                    isNext = true
                                } label: {
                                    Text("Продолжить")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .background(.blue)
                                        .cornerRadius(10)
                                }
                                
                                Button {
                                    if email == "1" {
                                        isNext.toggle()
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
                                    
                            } label: {
                                Text("Я ищу сотрудников")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
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
                .fullScreenCover(isPresented: $isNext) {
                    InputView(selected: $selected)
                }
            }
            .background(.color1)
        }
    }
    
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

#Preview {
    NavigationStack {
        MainScreenView(selected: .constant(3))
    }
}
