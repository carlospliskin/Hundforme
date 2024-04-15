//
//  EpisodeService.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import Foundation
import Combine

protocol EpisodeServiceProtocol {
    func fetchEpisodes() -> AnyPublisher<[Episode], Error>
}

class EpisodeService: EpisodeServiceProtocol {
    private let baseUrl = "https://rickandmortyapi.com/api/episode"
    private let session = URLSession.shared
    
    func fetchEpisodes() -> AnyPublisher<[Episode], Error> {
        guard let url = URL(string: baseUrl) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: EpisodesResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
