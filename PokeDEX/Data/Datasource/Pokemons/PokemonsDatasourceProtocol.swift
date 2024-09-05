//
//  PokemonsDatasourceProtocols.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import Foundation

protocol PokemonsDatasourceProtocol {
  func getPokemonList(at page: Int) async throws -> [PokemonListItemDTO]
  func getPokemonDetail(_ name: String) async throws -> PokemonDetailDTO
}
