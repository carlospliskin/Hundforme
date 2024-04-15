//
//  TestHundApp.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import SwiftUI

@main
struct TestHundApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true) // Oculta la barra de navegación en la vista Home
        }
    }
}
