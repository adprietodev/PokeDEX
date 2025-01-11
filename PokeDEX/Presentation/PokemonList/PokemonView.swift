//
//  PokemonView.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import SwiftUI

struct PokemonView: View {
  var pokemon: Pokemon
  
    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 16)
          .stroke(pokemon.types[0].color, lineWidth: 1)
        VStack {
          ImageURLView(pokemon: pokemon, size: 116)
          Text("\(pokemon.name)".uppercased())
            .tint(.black)
          HStack {
            ForEach(pokemon.types, id: \.self) { type in
              Text("\(type)".capitalized)
                .foregroundStyle(type.color)
            }
          }
        }
        .padding()
      }
    }
}
