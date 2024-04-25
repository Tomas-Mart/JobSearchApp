//
//  Favorites.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct Favorites: View {
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        ScrollView {
            ZStack {
                Color.color1
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    
                    Text("Избранное")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer(minLength: 10)
                    
                    Text("1 вакансия")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: 20)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack {
                                Text("Cейчас просматривает 1 человек")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundStyle(.green)
                                
                                Spacer()
                                
                                Image(.heartBlue)
                            }
                            
                            Text("UI/UX Designer")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Минск")
                                .font(.system(size: 16, weight: .regular))
                            
                            HStack {
                                Text("Мобирикс")
                                    .font(.system(size: 16, weight: .regular))
                                
                                Image(.mark)
                            }
                            
                            HStack {
                                Image(.bag)
                                
                                Text("Опыт от 1 года до 3 лет")
                                    .font(.system(size: 16, weight: .regular))
                            }
                            
                            Text("Опубликовано 20 февраля")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(.gray)
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
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    .background(.color2)
                    .cornerRadius(20)
                    
                }
            }
            .foregroundStyle(.white)
            .sheet(isPresented: $isNext) {
                Input(selected: $selected)
            }
        }
        .background(.color1)
    }
}
