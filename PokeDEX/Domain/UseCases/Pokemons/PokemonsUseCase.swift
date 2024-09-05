//
//  PokemonsUseCase.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

class PokemonsUseCase: PokemonsUseCaseProtocol {
  // MARK: - Properties
  let repository: PokemonRepositoryProtocol

  init(repository: PokemonRepositoryProtocol) {
    self.repository = repository
  }

  // MARK: - Functions
  func getPokemons(at page: Int) async throws -> [Pokemon] {
    try await repository.getPokemons(at: page)
  }

}
