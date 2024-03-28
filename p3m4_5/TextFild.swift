//
//  TextFild.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct TextFild: View {
    @State var number = ""
    var body: some View {
        TextField("*", text: $number)
            .frame(width: 50, height: 50, alignment: .center)
            .background(.color3)
            .cornerRadius(10)
    }
}
