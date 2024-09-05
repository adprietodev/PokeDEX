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
          .stroke(Color.getColor(by: pokemon.types[0]), lineWidth: 1)
        VStack {
          ImageURLView(pokemon: pokemon, size: 116)
          Text("\(pokemon.name)".uppercased())
            .tint(.black)
          HStack {
            ForEach(pokemon.types, id: \.self) { type in
              Text("\(type)".capitalized)
                .foregroundStyle(Color.getColor(by: type))
            }
          }
        }
        .padding()
      }
    }
}
