//
//  PokemonsDatasource.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import Foundation

class PokemonsDatasource: PokemonsDatasourceProtocol {
  // MARK: - Functions
  func getPokemonList(at page: Int) async throws -> [PokemonListItemDTO] {
    let offset = page * 20
    let pokemonURL = "\(Constants.URLs.baseURL.rawValue)/pokemon?limit=20&offset=\(offset)"
    
    guard let url = URL(string: pokemonURL) else {
      throw Constants.APIError.invalidURL
    }

    let request = URLRequest(url: url)
    let (data, response): (Data, URLResponse)

    do {
      (data, response) = try await URLSession.shared.data(for: request)
    } catch {
      throw Constants.APIError.requestFailed
    }

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      if let httpResponse = response as? HTTPURLResponse {
        throw Constants.APIError.responseUnsuccessfil(statusCode: httpResponse.statusCode)
      } else {
        throw Constants.APIError.responseUnsuccessfil(statusCode: 0)
      }
    }

    let pokemonsListPaginationDTO = try JSONDecoder().decode(PokemonListPaginationDTO.self, from: data)
    return pokemonsListPaginationDTO.results ?? []
  }
  
  func getPokemonDetail(_ name: String) async throws -> PokemonDetailDTO {
    let pokemonURL = "\(Constants.URLs.baseURL.rawValue)/pokemon/\(name)"

    guard let url = URL(string: pokemonURL) else {
      throw Constants.APIError.invalidURL
    }

    let request = URLRequest(url: url)
    let (data, response): (Data, URLResponse)

    do {
      (data, response) = try await URLSession.shared.data(for: request)
    } catch {
      throw Constants.APIError.requestFailed
    }

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      if let httpResponse = response as? HTTPURLResponse {
        throw Constants.APIError.responseUnsuccessfil(statusCode: httpResponse.statusCode)
      } else {
        throw Constants.APIError.responseUnsuccessfil(statusCode: 0)
      }
    }

    return try JSONDecoder().decode(PokemonDetailDTO.self, from: data)
  }
}
