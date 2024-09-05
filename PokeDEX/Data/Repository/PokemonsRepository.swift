//
//  PokemonsRepository.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

class PokemonsRepository: PokemonRepositoryProtocol {
  // MARK: - Properties
  let datasource: PokemonsDatasourceProtocol

  init(datasource: PokemonsDatasourceProtocol) {
    self.datasource = datasource
  }

  // MARK: - Functions
  func getPokemons(at page: Int) async throws -> [Pokemon] {
    let pokemonListItemDTO = try await datasource.getPokemonList(at: page)
    var pokemonDTO = [PokemonDetailDTO]()
    
    for pokemon in pokemonListItemDTO {
      let pokemonDetailDTO = try await datasource.getPokemonDetail(pokemon.name)
      pokemonDTO.append(pokemonDetailDTO)
    }

    return pokemonDTO.map { $0.toDomain() }
  }
}

fileprivate extension PokemonDetailDTO {
  func toDomain() -> Pokemon {
    Pokemon(id: self.id, name: self.name, height: self.height.convertToUnit(with: 10.0), weight: self.weight.convertToUnit(with: 10), image: self.sprites.other.officialArtWork.frontDefault ?? "empty", types: self.types.map { Constants.PokemonType.from($0.type.name) } , abilities: self.abilities.map{ $0.ability.name ?? ""} )
  }
}
