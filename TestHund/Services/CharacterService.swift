//
//  CharacterService.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import Foundation
import Combine

protocol CharacterServiceProtocol {
    func fetchCharacters() -> AnyPublisher<[Character], Error>
}

class CharacterService: CharacterServiceProtocol {
    private let baseUrl = "https://rickandmortyapi.com/api/character"
    private let session = URLSession.shared
    
    func fetchCharacters() -> AnyPublisher<[Character], Error> {
        guard let url = URL(string: baseUrl) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharactersResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
