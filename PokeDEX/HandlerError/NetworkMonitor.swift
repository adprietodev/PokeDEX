//
//  NetworkMonitor.swift
//  PokeDEX
//
//  Created by Adrian Prieto Villena on 9/9/24.
//

import Foundation
import Network

@Observable
class NetworkMonitor: ObservableObject {
  private let networkMonitor = NWPathMonitor()
  private let workerQueue = DispatchQueue(label: "Monitor")
  var isConnected = false

  init() {
    networkMonitor.pathUpdateHandler = { path in
      self.isConnected = path.status == .satisfied
    }

    networkMonitor.start(queue: workerQueue)
  }
}
