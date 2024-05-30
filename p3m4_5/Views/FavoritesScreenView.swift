//
//  Favorites.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct FavoritesScreenView: View {
    var vacancie: Vacancie
    @StateObject var vm = ContentViewModel()
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
                   
                    ForEach(vm.data, id: \.self) { vacancie in
                        if vacancie.isFavorite! {
                            FavoritesCard(vacancie: vacancie, isNext: $isNext)
                        }
                    }
                }
            }
            .foregroundStyle(.white)
        }
        .background(.color1)
    }
}
#Preview {
    FavoritesScreenView(vacancie: ContentViewModel.preview, selected: .constant(3))
}
