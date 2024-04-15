//
//  EpisodeView.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Buscar", text: $text)
                .padding(.vertical, 8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal, 15)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct EpisodeListView: View {
    @ObservedObject var viewModel: EpisodeListViewModel
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top, 10)
                
                List(filteredEpisodes) { episode in
                    VStack(alignment: .leading) {
                        Text("Nombre: \(episode.name)")
                        Text("Episodio: \(episode.episode)")
                        Text("Fecha al aire: \(episode.air_date)") // Asegúrate de usar air_date en lugar de airDate
                    }
                }
            }
            .navigationBarTitle("Episodios")
            //.navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchEpisodes()
        }
    }
    
    private var filteredEpisodes: [Episode] {
        if searchText.isEmpty {
            return viewModel.episodes
        } else {
            return viewModel.episodes.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.episode.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
