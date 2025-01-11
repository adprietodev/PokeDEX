//
//  NetworkUnavailableView.swift
//  PokeDEX
//
//  Created by Adrian Prieto Villena on 9/9/24.
//

import SwiftUI

struct NetworkUnavailableView: View {
    var body: some View {
        ContentUnavailableView("No Internet Connection", systemImage: "wifi.exclamationmark", description: Text("Please check your connection and try again"))
    }
}

#Preview {
    NetworkUnavailableView()
}
