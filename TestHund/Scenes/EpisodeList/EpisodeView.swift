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
                
                if filteredEpisodes.isEmpty {
                    Text("No se encontraron episodios y/o con ese nombre.")
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                } else {
                    List(filteredEpisodes) { episode in
                        VStack(alignment: .leading) {
                            Text("Nombre: \(episode.name)")
                            Text("Episodio: \(episode.episode)")
                            Text("Fecha al aire: \(episode.air_date)")
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
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
