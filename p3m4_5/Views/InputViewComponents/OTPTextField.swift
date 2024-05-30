//
//  OTPTextField.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 31.05.2024.
//

import SwiftUI

struct OTPTextField: View {
    let numberOfFields: Int
    @State var password: [String]
    @FocusState private var fieldFocus: Int?
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.password = Array(repeating: "", count: numberOfFields)
    }
    var body: some View {
        HStack(alignment: .center) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $password[index], prompt: Text("*").foregroundStyle(.gray))
                    .keyboardType(.numberPad)
                    .frame(width: 50, height: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .background(.color3)
                    .cornerRadius(10)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: password[index]) { newValue in
                        if password[index].count > 1 {
                            password[index] = String(password[index].suffix(1))
                        }
                        if !newValue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFocus = nil
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        } else {
                            fieldFocus = (fieldFocus ?? 0) - 1
                        }
                    }
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    OTPTextField(numberOfFields: 4)
}
