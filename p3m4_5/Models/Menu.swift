//
//  Menu.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 05.04.2024.
//

import Foundation

struct Menu: Hashable {
    var image: String
    var text: String
    var textTop: String
    
    static func getMenu() -> [Menu] {
        
        let menu1 = Menu(image: "personBlue", text: "Вакансии рядом с вами", textTop: "")
        
        let menu2 = Menu(image: "star", text: "Поднять резюме в поиске", textTop: "Поднять")
        
        let menu3 = Menu(image: "blank", text: "Временная работа и подработка", textTop: "")
        
        let menu4 = Menu(image: "heartBlue", text: "Полезные статьи и советы", textTop: "")
        
        let menu5 = Menu(image: "eyeGreen", text: "Недавно просмотренные", textTop: "")
                
        return [menu1, menu2, menu3, menu4, menu5]
    }
}
