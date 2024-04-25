//
//  Text.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 04.04.2024.
//

import SwiftUI

struct Questions: View {
    var vacancies: Vacancies
    var body: some View {
        ForEach(vacancies.questions ?? [], id: \.self) { questions in
            Text(questions)
                .padding()
                .background(.color3)
                .clipShape(.capsule)
        }
    }
}
