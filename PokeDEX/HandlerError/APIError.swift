//
//  APIError.swift
//  PokeDEX
//
//  Created by Adrian Prieto Villena on 6/9/24.
//

import Foundation

enum APIError: Error {
  case invalidURL
  case requestFailed
  case JSONParsedFailed(description: String)
  case responseUnsuccessfil(statusCode: Int)
}
