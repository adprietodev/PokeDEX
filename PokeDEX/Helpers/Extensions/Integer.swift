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

  func convertStringPositionNumber() -> String {
    String(format: "Nº%04d", self)
  }
}
