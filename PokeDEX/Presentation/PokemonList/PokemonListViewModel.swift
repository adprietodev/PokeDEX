//
//  PokemonListViewModel.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

class PokemonListViewModel: ObservableObject {
  let pokemonUseCase: PokemonsUseCaseProtocol
  
  @Published var isLoading: Bool = false
  @Published var pokemons = [Pokemon]()
  var currentPage: Int = 0
  

  init(pokemonUseCase: PokemonsUseCaseProtocol) {
    self.pokemonUseCase = pokemonUseCase
    setPokemons()
  }

  func setPokemons() {
    Task {
      do {
        let newPokemons = try await pokemonUseCase.getPokemons(at: currentPage)
        DispatchQueue.main.async { [weak self] in
          guard let self else { return }
          self.pokemons += newPokemons
          isLoading = false
        }
      } catch {
        // TODO: - Handle error
      }
    }
  }

  func loadNewPage() {
    isLoading = true
    currentPage += 1
    setPokemons()
  }
}
