//
//  Stub.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import SwiftUI

struct StubView: View {
    @Binding var selected: Int
    var body: some View {
        VStack {
            Text("Заглушка")
                .foregroundStyle(.red)
        }
    }
}
#Preview {
    StubView(selected: .constant(3))
}
