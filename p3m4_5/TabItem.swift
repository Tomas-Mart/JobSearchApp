//
//  TabItem.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct TabItem: View {
    var item: Int
    @Binding var selected: Int
    var body: some View {
        Button {
            withAnimation {
                selected = item
            }
        } label: {
            VStack {
                if item == 1 {
                    Image(.search)
                    Text("Поиск")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 2 {
                    Image(.heart)
                    Text("Избранное")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 3 {
                    Image(.letter)
                    Text("Отклики")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 4 {
                    Image(.message)
                    Text("Сообщения")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 5 {
                    Image(.person)
                    Text("Профиль")
                        .font(.system(size: 14, weight: .light))
                }
            }
        }
    }
}
