//
//  MyMenu.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 05.04.2024.
//

import SwiftUI

struct MyMenu:  View {
    @State var image: String
    @State var text: String
    @State var textTop: String
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                    Button(action:  {
                        
                    }, label: {
                        Image(image)
                            .padding(5)
                            .background(.placeholder)
                            .clipShape(.circle)
                            .padding(.leading, 10)
                            .padding(.bottom, 100)
                            .padding(.trailing, 100)
                    })
                
                Text(text)
                    .padding(.top, 30)
                    .padding(.leading, 10)
                    .padding(.trailing, 5)
                
                Button(action: {
                    
                }, label: {
                    Text(textTop)
                        .padding(.top, 100)
                        .padding(.leading, 10)
                        .padding(.trailing, 5)
                        .foregroundStyle(.green)
                })
            }
            .frame(maxWidth: 150, maxHeight: 150, alignment: .leading)
            .background(.color2)
            .cornerRadius(20)
        }
    }
}
