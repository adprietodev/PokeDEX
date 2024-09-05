//
//  PokemonListBuilder.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 4/9/24.
//

import Foundation

class PokemonListBuilder {
  func build() -> PokemonListView<PokemonListViewModel> {
    let pokemonDatasource = PokemonsDatasource()
    let pokemonRepository = PokemonsRepository(datasource: pokemonDatasource)
    let pokemonUseCase = PokemonsUseCase(repository: pokemonRepository)

    let viewModel = PokemonListViewModel(pokemonUseCase: pokemonUseCase)
    let view = PokemonListView(viewModel: viewModel)

    return view
  }
}
