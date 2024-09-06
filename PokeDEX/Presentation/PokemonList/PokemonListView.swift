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
          LazyVGrid (columns: [GridItem(.flexible()),GridItem(.flexible())], spacing: 24) {
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
          .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.message ?? "") , dismissButton: Alert.Button.default(
              Text("OK"), action: {
                viewModel.showingAlert.toggle()
              }))
          }
          .padding(.horizontal, 8)
          if viewModel.isLoading {
            ProgressView()
          }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Pokedex")
      }
      .tint(Color.black)
    }
}

#Preview {
  PokemonListBuilder().build()
}
