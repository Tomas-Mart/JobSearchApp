//
//  ContentViewVacancies.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct ContentViewVacancies: View {
    var vacancies: Vacancies
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Text("Cейчас просматривает \(vacancies.lookingNumber ?? 0) человек")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.green)
                    
                    Spacer()
                    
                    Image(.heart)
                }
                
                Text(vacancies.title ?? "")
                    .font(.system(size: 20, weight: .bold))
                
                Text(vacancies.address.town ?? "")
                    .font(.system(size: 16, weight: .regular))
                
                HStack {
                    Text(vacancies.company ?? "")
                        .font(.system(size: 16, weight: .regular))
                    
                    Image(.mark)
                }
                
                HStack {
                    Image(.bag)
                    
                    Text(vacancies.experience.previewText ?? "")
                        .font(.system(size: 16, weight: .regular))
                }
                
                Text("Опубликовано \(vacancies.publishedDate ?? "")")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.gray)
            }
            
            NavigationLink {
                JobVacancy(selected: $selected)
            } label: {
                Text("Откликнуться")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 30)
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
