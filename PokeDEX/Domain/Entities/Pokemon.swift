//
//  Pokemon.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

struct Pokemon {
  let id: Int
  let name: String
  let height: Double
  let weight: Double
  let image: String
  let types: [Constants.PokemonType]
  let abilities: [String]
}
