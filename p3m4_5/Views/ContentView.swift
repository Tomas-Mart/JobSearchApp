//
//  ContentView.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isError = false
    @State var selected = 1
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selected) {
                HomeScreenView(selected: $selected)
                    .tag(1)
                    .tabItem {
                        Image(.search)
                        Text("Поиск")
                    }
                
                FavoritesScreenView(selected: $selected)
                    .tag(2)
                    .tabItem {
                        Image(.heart)
                        Text("Избранное")
                    }
                
                StubView(selected: $selected)
                    .tag(3)
                    .tabItem {
                        Image(.letter)
                        Text("Отклики")
                    }
                
                StubView(selected: $selected)
                    .tag(4)
                    .tabItem {
                        Image(.message)
                        Text("Сообщения")
                    }
                
                StubView(selected: $selected)
                    .tag(5)
                    .tabItem {
                        Image(.person)
                        Text("Профиль")
                    }
            }
            
            HStack {
                ForEach(1...5, id: \.self) { item in
                    TabItem(item: item, selected: $selected)
                    
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .frame(maxWidth: .infinity)
            .background(.color1)
            .shadow(color: .color2, radius: 5)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
