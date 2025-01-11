//
//  Constants.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import SwiftUI

struct Constants {
  
  enum URLs: String {
    case baseURL = "https://pokeapi.co/api/v2"
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

    var color: Color {
            switch self {
            case .fighting:
                return Color("fighting")
            case .flying:
                return Color("flying")
            case .poison:
                return Color("poison")
            case .ground:
                return Color("ground")
            case .rock:
                return Color("rock")
            case .bug:
                return Color("bug")
            case .ghost:
                return Color("ghost")
            case .steel:
                return Color("steel")
            case .fire:
                return Color("fire")
            case .water:
                return Color("water")
            case .grass:
                return Color("grass")
            case .electric:
                return Color("electric")
            case .psychic:
                return Color("psychic")
            case .ice:
                return Color("ice")
            case .dragon:
                return Color("dragon")
            case .dark:
                return Color("dark")
            case .fairy:
                return Color("fairy")
            case .normal:
                return Color("normal")
            case .stellar:
              return Color("stellar")
            case .unknown:
              return Color("unknown")
            case .shadow:
              return Color("shadow")
            }
        }
  }
}
