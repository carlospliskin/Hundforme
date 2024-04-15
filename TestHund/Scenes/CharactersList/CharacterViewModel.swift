//
//  CharacterViewModel.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import Combine
import SwiftUI

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = [] {
        didSet {
            // Aquí puedes realizar cualquier lógica adicional si es necesario
        }
    }
    
    private let characterService: CharacterServiceProtocol
    
    init(characterService: CharacterServiceProtocol) {
        self.characterService = characterService
        fetchCharacters()
    }
    
    func fetchCharacters() {
        characterService.fetchCharacters()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching characters: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { characters in
                print("Characters received: \(characters)")
                self.characters = characters
            })
            .store(in: &cancellables)
    }
    
    private var cancellables: Set<AnyCancellable> = []
}
