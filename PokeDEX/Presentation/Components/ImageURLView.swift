//
//  ImageURLView.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import SwiftUI

struct ImageURLView: View {
  let pokemon: Pokemon
  let size: CGFloat

  var body: some View {
    AsyncImage(url: URL(string: pokemon.image)) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: size, height: size)
    } placeholder: {
      Image("pokemonPlaceholder")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.red)
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
  }
}
