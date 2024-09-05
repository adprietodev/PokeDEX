//
//  PokeDEXApp.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 3/9/24.
//

import SwiftUI

@main
struct PokeDEXApp: App {
    var body: some Scene {
        WindowGroup {
          PokemonListBuilder().build()
        }
    }
}
