//
//  NetworkMonitor.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import Foundation
import Network

//MARK: To check internet connectivity

//Network connection changes are not detected consistently in the Simulator, the suggestion is to perform testing on a real device.

class NetworkMonitor: ObservableObject {

    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)

    @Published var connected: Bool = false
    private var isConnected: Bool = false

    init() {
        monitor.start(queue: queue)

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                OperationQueue.main.addOperation {
                    self.isConnected = true
                    self.connected = self.isConnected
                }
            } else {
                OperationQueue.main.addOperation {
                    self.isConnected = false
                    self.connected = self.isConnected
                }
                
            }
        }
    }
}
