//
//  HomeVIew.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Rickey Morti")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Spacer()
            
            NavigationLink(destination: AppRouter.shared.navigateToEpisodes()) {
                Text("Episodios")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            NavigationLink(destination: AppRouter.shared.navigateToCharacters()) {
                Text("Personajes")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
