//
//  LaunchDetailView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import SwiftUI

struct LaunchDetailView: View {
    
    var mission: Mission
    
    var body: some View {
            Text(mission.name)
    }
}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailView(mission: Mission(id: 111, name: "Test"))
    }
}
