//
//  LaunchListView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import SwiftUI

struct LaunchListView: View {
    
    @StateObject var viewModel = LaunchListViewModel()
    
    var body: some View {
        ZStack {
            NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                List(viewModel.launches, id: \.missionName) { launch in
                    NavigationLink {
                        LaunchDetailView(launch: launch)
                    } label: {
                        LaunchCell(launch: launch)
                    }
                }
                .navigationTitle("Launches")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
            } detail: {
                Text("Select a Mission")
            }
            .navigationSplitViewStyle(.balanced)
            .task {
                print("API called")
                viewModel.getLaunches()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}





