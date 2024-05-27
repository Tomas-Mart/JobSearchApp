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
    @State private var currentIndex = 0
    @State private var password = [Int?](repeating: nil, count: 4)
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
                            TextField("", value: $password[index], format: .number, prompt: Text("*").foregroundStyle(.gray))
                                .frame(width: 50, height: 50, alignment: .center)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .background(.color3)
                                .cornerRadius(10)
                                .onReceive(password[index].publisher.collect()) { input in
//                                    handleInput(index, <#T##Int?#>)
                                }
                        }
                    }
                    
                    Button {
                        isNext = true
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
            .fullScreenCover(isPresented: $isNext) {
                ContentView()
                    
            }
        }
    }
    func handleInput(_ index: Int, _ input: Int?) {
        guard let input = input, index == currentIndex else { return }
        
        password[index] = input
        currentIndex += 1
        
        if currentIndex == 4 {
            // TODO: Here you would typically call your backend to verify the code.
            // If the code is valid, you would then transition to the next screen.
            
            // Reset the digits and current index for the next code input
            password = [Int?](repeating: nil, count: 4)
            currentIndex = 0
        }
    }
}
#Preview {
    InputView(selected: .constant(3))
}
