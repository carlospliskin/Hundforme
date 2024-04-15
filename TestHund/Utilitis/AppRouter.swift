//
//  AppRouter.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import Foundation
import SwiftUI

class AppRouter {
    static let shared = AppRouter()
    
    private init() {}
    
    func navigateToEpisodes() -> some View {
        return EpisodeListView(viewModel: EpisodeListViewModel(episodeService: EpisodeService()))
    }
    
    func navigateToCharacters() -> some View {
        return CharacterListView(viewModel: CharacterListViewModel(characterService: CharacterService()))
    }
}
