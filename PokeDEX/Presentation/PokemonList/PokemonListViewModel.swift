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
  @Published var showingAlert = false
  @Published var networkMonitor = NetworkMonitor()
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
          isLoading.toggle()
        }
      } catch let error as APPError{
        DispatchQueue.main.async { [weak self] in
          guard let self else { return }
          showingAlert.toggle()
          message = error.localizedDescription
          isLoading.toggle()
        }
      }
    }
  }
  
  func loadNewPage() {
    isLoading.toggle()
    currentPage += 1
    setPokemons()
  }
}
