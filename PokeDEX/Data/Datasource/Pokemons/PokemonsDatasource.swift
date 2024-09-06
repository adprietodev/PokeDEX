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
      throw APIError.invalidURL
    }
    
    let (data, response): (Data, URLResponse) = try await getDataAndResponse(url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      if let httpResponse = response as? HTTPURLResponse {
        throw APIError.responseUnsuccessfil(statusCode: httpResponse.statusCode)
      } else {
        throw APIError.responseUnsuccessfil(statusCode: 0)
      }
    }
    
    do {
      let pokemonsListPaginationDTO = try JSONDecoder().decode(PokemonListPaginationDTO.self, from: data)
      return pokemonsListPaginationDTO.results ?? []
    } catch {
      throw APIError.JSONParsedFailed(description: "PokemonListPaginationDTO parsed Error")
    }
  }
  
  func getPokemonDetail(_ name: String) async throws -> PokemonDetailDTO {
    let pokemonURL = "\(Constants.URLs.baseURL.rawValue)/pokemon/\(name)"
    
    guard let url = URL(string: pokemonURL) else {
      throw APIError.invalidURL
    }
    
    let (data, response): (Data, URLResponse) = try await getDataAndResponse(url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      if let httpResponse = response as? HTTPURLResponse {
        throw APIError.responseUnsuccessfil(statusCode: httpResponse.statusCode)
      } else {
        throw APIError.responseUnsuccessfil(statusCode: 0)
      }
    }
    do {
      return try JSONDecoder().decode(PokemonDetailDTO.self, from: data)
    } catch {
      throw APIError.JSONParsedFailed(description: "PokemonDetailDTO parsed Error")
    }
  }
  
  private func getDataAndResponse(_ url: URL) async throws -> (Data, URLResponse) {
    let request = URLRequest(url: url)
    do {
      return try await URLSession.shared.data(for: request)
    } catch {
      throw APIError.requestFailed
    }
  }
}
