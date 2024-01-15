//
//  SpaceXAppApp.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import SwiftUI
import Network

@main
struct SpaceXAppApp: App {
    
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false

    var body: some View {
        
        LaunchListView()
            .onChange(of: networkMonitor.connected) { connection in
                showNetworkAlert = connection == false
            }
            .popover(isPresented: $showNetworkAlert) {
                Text("Network connection seems to be offline.")
            }
    }
}

