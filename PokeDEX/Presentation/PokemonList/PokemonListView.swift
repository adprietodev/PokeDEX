//
//  PokemonListView.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import SwiftUI

struct PokemonListView<VM: PokemonListViewModel>: View {
  @StateObject var viewModel: VM

    var body: some View {
      NavigationStack {
        ScrollView {
          LazyVGrid (columns: [GridItem(.flexible()),GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.pokemons, id: \.id) { pokemon in
              NavigationLink(destination: PokemonDetailBuilder().build(pokemon)) {
                PokemonView(pokemon: pokemon)
                  .padding(.horizontal, 8)
                  .onAppear {
                    if pokemon.id == viewModel.pokemons.last?.id {
                      viewModel.loadNewPage()
                    }
                  }
              }
            }
          }
          .padding(.horizontal, 8)
          if viewModel.isLoading {
            ProgressView()
          }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("PokeDEX")
      }
      .tint(Color.black)
    }
}

#Preview {
  PokemonListBuilder().build()
}
