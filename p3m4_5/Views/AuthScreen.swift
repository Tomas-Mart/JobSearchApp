//
//  MainScreen.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct AuthScreen: View {
    @State private var email = ""
    @State private var isNext = false
    @State private var isEmailValid = false
    @State private var isRed = false
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
                                    .onChange(of: email) { newValue in
                                        self.isEmailValid = self.validateEmail(email: newValue)
                                    }
                                    .overlay(Button(action: {
                                        email = ""
                                        isRed = false
                                    }) {
                                        if !email.isEmpty {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.white)
                                        }
                                    }
                                        .padding(.trailing, 15), alignment: .trailing)
                            }
                            .background(.color3)
                            .cornerRadius(10)
                            .shadow(color: .color1, radius: 10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: isRed ? 2 : 0))
                            if isRed {
                                Text("Вы ввели неверный е-mail")
                                    .foregroundStyle(.red)
                            }
                            HStack{
                                Button {
                                    if isEmailValid {
                                        isNext.toggle()
                                    } else {
                                        isRed.toggle()
                                    }
                                } label: {
                                    Text("Продолжить")
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .background(email.isEmpty ? .blue.opacity(0.3) : .blue)
                                        .foregroundStyle(email.isEmpty ? .white.opacity(0.3) : .white)
                                        .cornerRadius(10)
                                }
                                .disabled(email.isEmpty)
                                
                                
                                Button {
                                    if email == "1" {
                                        isNext.toggle()
                                    }
                                } label: {
                                    Text("Войти с паролем")
                                        .frame(maxWidth: .infinity, minHeight: 40)
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
                    InputView()
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
        AuthScreen()
    }
}
