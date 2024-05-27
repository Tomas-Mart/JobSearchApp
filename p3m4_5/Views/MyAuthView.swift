//
//  MyAuth.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 27.05.2024.
//

import SwiftUI

struct MyAuthView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        VStack{
            if status{
                ContentView()
            } else {
                MainScreenView(selected: .constant(3))
            }
        }.animation(.spring())
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                    
                    let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    self.status = status
                }
            }
    }
}
#Preview {
    MyAuthView()
}
