//
//  LaunchListView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import SwiftUI

struct Mission : Codable, Identifiable, Hashable{
    var id: Int
    var name: String
}

struct LaunchListView: View {
     
    var missions : [Mission] = [Mission(id: 123, name: "abc"), Mission(id: 456, name: "pqr"), Mission(id: 789, name: "xyz")]
    
    @State private var missionSelected: Mission?
    
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
            List(missions) { mission in
                NavigationLink {
                    LaunchDetailView(mission: mission)
                } label: {
                    Text(mission.name)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Mission")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}





