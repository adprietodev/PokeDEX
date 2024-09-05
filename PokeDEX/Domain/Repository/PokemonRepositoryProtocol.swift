//
//  PokemonRepositoryProtocol.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

protocol PokemonRepositoryProtocol {
  func getPokemons(at page: Int) async throws -> [Pokemon]
}
