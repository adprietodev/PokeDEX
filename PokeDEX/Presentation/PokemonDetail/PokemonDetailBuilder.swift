//
//  PokemonDetailBuilder.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 5/9/24.
//

import Foundation

class PokemonDetailBuilder {
  func build(_ pokemon: Pokemon) -> PokemonDetailView<PokemonDetailViewModel> {
    let viewModel = PokemonDetailViewModel(pokemon: pokemon)
    return PokemonDetailView(viewModel: viewModel)
  }
}
