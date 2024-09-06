//
//  APPError.swift
//  PokeDEX
//
//  Created by Adrian Prieto Villena on 6/9/24.
//

import Foundation

enum APPError: Error {
  case notPokemons
  case connectionError(description: String)

  var localizedDescription: String {
    switch self {
    case .notPokemons:
      "No more pokemon"
    case .connectionError(let description):
      description
    }
  }
}
