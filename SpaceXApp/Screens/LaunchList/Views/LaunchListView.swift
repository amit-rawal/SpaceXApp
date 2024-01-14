//
//  LaunchListView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import SwiftUI

//struct Mission : Codable, Identifiable, Hashable{
//    var id: Int
//    var name: String
//}

struct LaunchListView: View {
    
    @StateObject var viewModel = LaunchListViewModel()
    
    var body: some View {        
        ZStack {
            NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                List(viewModel.launches, id: \.flightNumber) { launch in
                    NavigationLink {
                        //LaunchDetailView(mission: mission)
                    } label: {
                        Text(launch.missionName)
                    }
                }
                .navigationTitle("Launches")
                .listStyle(.plain)
            } detail: {
                Text("Select a Mission")
            }
            .navigationSplitViewStyle(.balanced)
            .task {
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





