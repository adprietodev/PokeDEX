//
//  PokemonInformation.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import Foundation

struct PokemonDetailDTO: Codable {
  let id: Int
  let name: String
  let height: Int
  let weight: Int
  let sprites: Sprites
  let types: [PokemonType]
  let abilities: [Abilities]

  struct Abilities: Codable {
    let ability: Ability
  }

  struct Ability: Codable {
    let name: String?
  }
  
  struct Sprites: Codable {
    let frontDefautlt: String?
    let other: OtherSprites
    
    enum CodingKeys: String, CodingKey {
      case frontDefautlt = "front_default"
      case other
    }
  }
  
  struct OtherSprites: Codable {
    let officialArtWork: OfficialArtWork
    
    enum CodingKeys: String, CodingKey {
      case officialArtWork = "official-artwork"
    }
  }
  
  struct OfficialArtWork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
      case frontDefault = "front_default"
    }
  }
  
  struct PokemonType: Codable {
    let slot: Int
    let type: TypeName
  }

  struct TypeName: Codable {
    let name: String
  }
}
