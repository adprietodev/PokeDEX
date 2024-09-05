//
//  Integer.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 5/9/24.
//

import Foundation

extension Int {
  func convertToUnit(with divider: Double) -> Double{
    Double(self)/divider
  }
}
