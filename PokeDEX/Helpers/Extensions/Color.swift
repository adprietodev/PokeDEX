//
//  Color.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import SwiftUI

extension Color {
    static func getColor(by pokemonType: Constants.PokemonType) -> Color {
        switch pokemonType {
        case .fighting:
            return Color.init(red: 194.0/255.0, green: 46.0/255.0, blue: 40.0/255.0)
        case .flying:
            return Color.init(red: 169.0/255.0, green: 143.0/255.0, blue: 243.0/255.0)
        case .poison:
            return Color.init(red: 163.0/255.0, green: 62.0/255.0, blue: 161.0/255.0)
        case .ground:
            return Color.init(red: 226.0/255.0, green: 191.0/255.0, blue: 101.0/255.0)
        case .rock:
            return Color.init(red: 182.0/255.0, green: 161.0/255.0, blue: 54.0/255.0)
        case .bug:
            return Color.init(red: 166.0/255.0, green: 185.0/255.0, blue: 26.0/255.0)
        case .ghost:
            return Color.init(red: 115.0/255.0, green: 87.0/255.0, blue: 151.0/255.0)
        case .steel:
            return Color.init(red: 183.0/255.0, green: 183.0/255.0, blue: 206.0/255.0)
        case .fire:
            return Color.init(red: 238.0/255.0, green: 129.0/255.0, blue: 48.0/255.0)
        case .water:
            return Color.init(red: 99.0/255.0, green: 144.0/255.0, blue: 240.0/255.0)
        case .grass:
            return Color.init(red: 122.0/255.0, green: 199.0/255.0, blue: 76.0/255.0)
        case .electric:
            return Color.init(red: 247.0/255.0, green: 208.0/255.0, blue: 44.0/255.0)
        case .psychic:
            return Color.init(red: 249.0/255.0, green: 85.0/255.0, blue: 135.0/255.0)
        case .ice:
            return Color.init(red: 150.0/255.0, green: 217.0/255.0, blue: 214.0/255.0)
        case .dragon:
            return Color.init(red: 111.0/255.0, green: 53.0/255.0, blue: 252.0/255.0)
        case .dark:
            return Color.init(red: 112.0/255.0, green: 87.0/255.0, blue: 70.0/255.0)
        case .fairy:
            return Color.init(red: 214.0/255.0, green: 133.0/255.0, blue: 173.0/255.0)
        case .stellar, .unknown, .shadow, .normal:
            return Color.init(red: 0.0, green: 0.0, blue: 0.0)
        }
    }
}
