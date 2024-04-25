//
//  Input.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct Input: View {
    @Binding var selected: Int
    @State var isNext = false
    @State var number = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.color1
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Отправили код на  example@mail.ru")
                            .font(.system(size: 16, weight: .bold))
                        
                        Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                            .font(.system(size: 14, weight: .regular))
                    }
                    
                    HStack(alignment: .center) {
                        
                        TextFild()
                        TextFild()
                        TextFild()
                        TextFild()
                        
                    }
                    
                    NavigationLink {
                        HomeScreen(selected: $selected)
                    } label: {
                        Text("Подтвердить")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                            .font(.system(size: 16, weight: .bold))
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
                .foregroundStyle(.white)
                .padding(.all, 10)
            }
            .sheet(isPresented: $isNext) {
            }
        }
    }
}
