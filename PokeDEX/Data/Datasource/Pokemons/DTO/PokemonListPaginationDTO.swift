//
//  Pagination.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import Foundation

struct PokemonListPaginationDTO: Codable {
  let count: Int?
  let next: String?
  let previous: String?
  let results: [PokemonListItemDTO]?
}
