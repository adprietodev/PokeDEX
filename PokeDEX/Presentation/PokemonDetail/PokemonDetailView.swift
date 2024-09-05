//
//  PokemonDetailView.swift
//  PokeDEX
//
//  Created by Adrián Prieto Villena  on 5/9/24.
//

import SwiftUI

struct PokemonDetailView<VM: PokemonDetailViewModel>: View {
  @StateObject var viewModel: VM

    var body: some View {
      VStack {
        ZStack {
          Circle()
            .trim(from: 0.5, to: 1)
            .fill(Color.getColor(by: viewModel.pokemon.types[0]))
          VStack {
            ImageURLView(pokemon: viewModel.pokemon, size: 240)
            Text("\(viewModel.pokemon.name)".uppercased())
            VStack(alignment: .leading) {
              HStack{
                Text("Height: \(String(format:"%.2f",viewModel.pokemon.height)) m")
                Spacer()
                Text("Weight: \(String(format:"%.2f",viewModel.pokemon.weight)) kg")
              }
            }
            .padding()
          }
        }
        VStack(alignment: .leading) {
          Text("Abilities:")
            .bold()
          HStack {
            ForEach(viewModel.pokemon.abilities, id: \.self) { ability in
              Spacer()
              Text("\(ability)")
              Spacer()
            }
          }
        }
        .padding(.horizontal, 16)

        VStack(alignment: .leading) {
          Text("Type:")
            .bold()
          HStack {
            ForEach(viewModel.pokemon.types, id: \.self) { type in
              ZStack {
                RoundedRectangle(cornerRadius: 6)
                  .fill(Color.getColor(by: type))
                  .frame(width: (UIScreen.main.bounds.size.width/CGFloat(viewModel.pokemon.types.count) - CGFloat(24)), height: 50)
                Text("\(type)".capitalized)
                  .foregroundStyle(.white)
                  .bold()
              }
            }
          }
        }
        .padding()
        Spacer()
      }
      .navigationBarTitle("", displayMode: .inline)
    }
}
