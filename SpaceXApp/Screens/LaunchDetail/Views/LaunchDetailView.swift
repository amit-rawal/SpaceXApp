//
//  LaunchDetailView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import SwiftUI

struct LaunchDetailView: View {
    
    let launch: LaunchModel
    
    var body: some View {

        ZStack {

            ScrollView {
                    
                VStack(spacing: 20) {
                    
                    ImageViewDetail(launch: launch)
       
                    InformationView(launch: launch)
                    
                    LaunchDesc(launch: launch)
//
//                    if let rocket = contentVM.rocket {
//                        RocketInfo(rocket: rocket)
//                    }
//
//                    if let launchpad = contentVM.launchpad {
//                        Launchpad(launchpad: launchpad)
//                    }
 
                }
                .padding(.all, 15)
                
                Spacer()
            }
            .navigationBarTitle(launch.missionName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let launchData = MockManager.shared.launchData?.first {
            LaunchDetailView(launch: launchData)
        }
    }
}

