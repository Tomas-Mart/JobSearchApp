//
//  HomeScreen.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject var vm = ContentViewModel()
    var menu: [Menu] = Menu.getMenu()
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        NavigationStack {
            ZStack {
                Color.color1.ignoresSafeArea()
                ScrollView {                
                    VStack(spacing: 20) {
                        HStack {
                            HStack {
                                
                                Image(.search)
                                    .padding(.all, 10)
                                
                                Text("Должность, ключевые слова")
                                    .foregroundColor(.gray)
                                    .padding(.all, 10)
                                    .padding(.trailing,20)
                            }
                            .background(.color3)
                            .cornerRadius(10)
                            
                            Image(.setting)
                                .padding(.all, 10)
                                .background(.color3)
                                .cornerRadius(10)
                        }
                        .background(.color1)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer()
                                ForEach(menu, id: \.self) { item in
                                    MyMenu(image: item.image, text: item.text, textTop: item.textTop)
                                }
                                Spacer()
                            }
                        }
                        
                        Text("Вакансии для вас")
                            .padding(.leading, 10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .font(.system(size: 25, weight: .bold))
                        
                        ForEach(vm.data, id: \.self) { vacancie in
                            VacanciesCard(vacancie: vacancie, selected: $selected)
                        }
                    }
                }
                .foregroundStyle(.white)
                
                Spacer(minLength: 90)
            }
            .toolbarBackground(.color1, for: .navigationBar)
        }
    }
}
#Preview {
    NavigationStack {
        HomeScreenView(selected: .constant(3))
    }
}
