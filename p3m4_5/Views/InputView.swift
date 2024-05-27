//
//  Input.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct InputView: View {
    @Binding var selected: Int
    @State var isNext = false
    @State var number = ""
    @State private var password = ""
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
                        ForEach(0..<4) { index in
                            SecureField("*", text: $password, prompt: Text("*").foregroundColor(.gray))
                                .keyboardType(.numberPad)
                                .frame(width: 50, height: 50, alignment: .center)
                                .multilineTextAlignment(.center)
                                .background(.color3)
                                .cornerRadius(10)
                        }
                    }
                    
                    NavigationLink {
                        ContentView()
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
#Preview {
    InputView(selected: .constant(3))
}
