//
//  ContentViewVacancies.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct ContentVacancies: View {
    var vacancie: Vacancies
    @State var isActive = false
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            NavigationLink {
                JobVacancyDetailsView(vacancie: vacancie, selected: $selected)
            } label: {
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        Text("Cейчас просматривает \(vacancie.lookingNumber ?? 0) человек")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.green)
                        
                        Spacer()
                        Button(action: {
                            isActive.toggle()
                        }, label: {
                            Image(isActive ? .heartBlue : .heart)
                        })
                    }
                    
                    Text(vacancie.title ?? "")
                        .font(.system(size: 20, weight: .bold))
                    
                    Text(vacancie.address.town ?? "")
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        Text(vacancie.company ?? "")
                            .font(.system(size: 16, weight: .regular))
                        
                        Image(.mark)
                    }
                    
                    HStack {
                        Image(.bag)
                        
                        Text(vacancie.experience.previewText ?? "")
                            .font(.system(size: 16, weight: .regular))
                    }
                    
                    Text("Опубликовано \(vacancie.publishedDate ?? "")")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.gray)
                }
            }
            
            Button {
                
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
#Preview {
    ContentVacancies(vacancie: ContentViewModel.preview, selected: .constant(3))
}
