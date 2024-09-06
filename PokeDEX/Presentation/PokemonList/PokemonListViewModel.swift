//
//  PokemonListViewModel.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

class PokemonListViewModel: ObservableObject {
  let pokemonUseCase: PokemonsUseCaseProtocol
  
  @Published var isLoading = false
  @Published var pokemons = [Pokemon]()
  @Published var message: String? = nil
  @Published public var showingAlert = false
  var currentPage = 0
  

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
      } catch let error as APPError{
        DispatchQueue.main.async { [weak self] in
          guard let self else { return }
          showingAlert.toggle()
          message = error.localizedDescription
          isLoading = false
        }
      }
    }
  }

  func loadNewPage() {
    isLoading = true
    currentPage += 1
    setPokemons()
  }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let message: String
}
