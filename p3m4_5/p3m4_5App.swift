//
//  p3m4_5App.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

@main
struct p3m4_5App: App {
    
    @AppStorage("isAuthorized") var isAuthorized: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isAuthorized {
                NavigationStack {
                    ContentView()
                }
            } else {
                AuthScreen()
            }
        }
    }
}
