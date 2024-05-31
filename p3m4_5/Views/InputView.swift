//
//  Input.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct InputView: View {
    @AppStorage("isAuthorized") var isAuthorized: Bool = false
    @State var isNext = false
    @State private var currentIndex = 0
    @Binding var email: String
    var body: some View {
        NavigationView {
            ZStack {
                Color.color1
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Отправили код на  \(email)")
                            .font(.system(size: 16, weight: .bold))
                        
                        Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                            .font(.system(size: 14, weight: .regular))
                    }
                    
                    OTPTextField(numberOfFields: 4)
                    
                    Button {
                        isAuthorized = true
                    } label: {
                        Text("Подтвердить")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .font(.system(size: 16, weight: .bold))
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
                .foregroundStyle(.white)
                .padding(.all, 10)
            }
        }
    }
}

#Preview {
    InputView(email: .constant("example@mail.ru"))
}
