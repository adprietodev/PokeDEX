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
  @State private var retryCount = 0

  var body: some View {
    AsyncImage(url: URL(string: pokemon.image)) { phase in
      switch phase {
      case .empty:
        ProgressView()
          .frame(width: size, height: size)
      case .success(let image):
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: size, height: size)
      case .failure:
        Image("pokemonPlaceholder")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(.red)
          .frame(width: size, height: size)
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .onAppear {
            if retryCount < 3 {
              DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                retryCount += 1
              }
            }
          }
      @unknown default:
        EmptyView()
      }
    }
    .id(retryCount)
  }
}
