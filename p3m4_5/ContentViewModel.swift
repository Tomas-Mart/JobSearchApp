//
//  ContentViewModel.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 20.03.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    let service = Service()
    @Published var data = [Vacancies]()
    init(){
        getAllNews()
    }
    
    func getAllNews() {
        service.getNews { vacancies in
            self.data = vacancies
        }
    }
}
