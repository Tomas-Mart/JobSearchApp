//
//  ContentViewVacanciesTest.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 01.04.2024.
//

import SwiftUI

struct JobVacancyDetailsView: View {
    var vacancie: Vacancie
    @State var isNext = false
    @State var isText = false
    @State private var text = ""
    @Binding var selected: Int
    @FocusState private var amountIsFocused: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                Color.color1.ignoresSafeArea()
                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text(vacancie.title ?? "")
                            Text(vacancie.salary.full ?? "")
                            Text("Требуемый опыт: от \(vacancie.experience.text ?? "")")
                            ForEach(vacancie.schedules ?? [], id: \.self) { schedules in
                                Text(schedules)
                            }
                            
                            HStack(spacing: 10) {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("\(vacancie.appliedNumber ?? 0) человек уже откликнулись")
                                    }
                                    VStack {
                                        Image(.personGreen)
                                            .padding(.top, 0)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                                .background(.color5)
                                .cornerRadius(10)
                                
                                
                                HStack{
                                    Spacer()
                                    VStack {
                                        Text("\(vacancie.lookingNumber ?? 0) человека сейчас смотрят")
                                    }
                                    VStack {
                                        Image(.eyeGreen)
                                            .padding(.top, 0)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                                .background(.color5)
                                .cornerRadius(10)
                                
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(vacancie.company ?? "")
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
                                
                                Text("\(vacancie.address.town ?? ""), улица \(vacancie.address.street ?? ""), \(vacancie.address.house ?? "")")
                                    .padding(.leading, 20)
                                    .padding(.bottom, 20)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(.color2)
                            .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Text(vacancie.description ?? "")
                                
                                Text("Ваши задачи")
                                    .font(.title)
                                    .bold()
                                
                                Text(vacancie.responsibilities ?? "")
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("Задайте вопрос работодателю")
                                        .bold()
                                    Text("Он получит его с откликом на вакансию")
                                        .foregroundColor(.gray)
                                }
                                VStack(alignment: .leading, spacing: 10) {
                                    Questions(vacancie: vacancie)
                                }
                            }
                        }
                        .padding()
                        .background(.color1).opacity(isNext ? 0.1 : 1)
                        
                        VStack {
                            if isNext {
                                HStack(spacing: 20) {
                                    
                                    Button {
                                        amountIsFocused = false
                                    } label: {
                                        Image(.face)
                                            .resizable()
                                            .frame(width: 48, height: 48)
                                            .cornerRadius(24)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Резюме для отклика")
                                        Text(vacancie.title ?? "")
                                    }
                                    Spacer()
                                }
                            }
                            if isText {
                                VStack(spacing: 10) {
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .frame(height: 0.5)
                                        .padding(.vertical)
                                    TextField("", text: $text, prompt: Text("Ваше сопроводительное письмо").foregroundColor(.gray))
                                        .keyboardType(.alphabet)
                                        .focused($amountIsFocused)
                                }
                            }
                            Spacer(minLength: 100)
                            VStack(spacing: 30) {
                                if isNext {
                                    Text("Добавить сопроводительное письмо")
                                        .foregroundStyle(.green)
                                        .bold()
                                        .onTapGesture {
                                            isText.toggle()
                                        }
                                }
                                Button {
                                    isNext.toggle()
                                } label: {
                                    Text("Откликнуться")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .background(.green)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                        Spacer()
                    }
                }
                .foregroundStyle(.white)
                .padding(.bottom, amountIsFocused ? 150 : 20)
            }
            .toolbarBackground(.color1, for: .navigationBar)
        }
    }
}

#Preview {
    JobVacancyDetailsView(vacancie: ContentViewModel.preview, selected: .constant(3))
}
