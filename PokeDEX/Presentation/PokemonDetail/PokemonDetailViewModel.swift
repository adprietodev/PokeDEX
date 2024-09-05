//
//  PokemonDetailViewModel.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 5/9/24.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
  @Published var pokemon: Pokemon

  init(pokemon: Pokemon) {
    self.pokemon = pokemon
  }
}
