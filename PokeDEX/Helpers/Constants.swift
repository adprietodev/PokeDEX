//
//  Constants.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import Foundation

struct Constants {
  
  enum URLs: String {
    case baseURL = "https://pokeapi.co/api/v2"
  }
  
  enum APIError: Error {
    case notURLResponse
    case invalidURL
    case requestFailed
    case responseUnsuccessfil(statusCode: Int)
  }
  
  enum PokemonType: String {
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case normal
    case stellar
    case unknown
    case shadow
    
    static func from(_ typeName: String) -> PokemonType {
      return PokemonType(rawValue: typeName.lowercased()) ?? .unknown
    }
  }
}
