//
//  CharacterListView.swift
//  TestHund
//
//  Created by Carlos Paredes León on 14/04/24.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    
    var body: some View {
        List(viewModel.characters) { character in
            VStack(alignment: .leading) {
                Text(character.name)
                Text(character.species)
                Text(character.status)
            }
            .navigationBarTitle("Personajes")
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}
