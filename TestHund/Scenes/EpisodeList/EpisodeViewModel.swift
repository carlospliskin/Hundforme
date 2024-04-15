//
//  EpisodeViewModel.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import SwiftUI
import Combine

class EpisodeListViewModel: ObservableObject {
    @Published var episodes: [Episode] = [] {
        didSet {
            // Aquí puedes realizar cualquier lógica adicional si es necesario
        }
    }
    
    private let episodeService: EpisodeServiceProtocol
    
    init(episodeService: EpisodeServiceProtocol) {
        self.episodeService = episodeService
        fetchEpisodes()
    }
    
    func fetchEpisodes() {
        episodeService.fetchEpisodes()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching episodes: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { episodes in
                print("Episodes received: \(episodes)")
                self.episodes = episodes
            })
            .store(in: &cancellables)
    }
    
    private var cancellables: Set<AnyCancellable> = []
}
