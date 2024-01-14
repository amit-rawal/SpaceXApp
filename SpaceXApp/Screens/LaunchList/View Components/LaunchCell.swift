//
//  LaunchCell.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct LaunchCell: View {
    
    let launch: LaunchModel

    var body: some View {
        
       HStack {
            VStack {
                
                if let imgUrl = launch.links.missionPatchSmall {
                    RemoteImage(url: imgUrl)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                    
                } else {
                    VStack {
                        Image("default-icon")
                            .resizable()
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color.lightGray)
                    .cornerRadius(50)
                }
            }.padding(.trailing, 5)


            VStack(alignment: .leading, spacing: 5) {
                
                Text("Mission Name: \(launch.missionName)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                if let rocketName = launch.rocket.rocketName {
                    Text("Rocket Name: \(rocketName)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                }
                
                if let siteName = launch.launchSite.siteName {
                    Text("Site Name: \(siteName)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                }
             
                if let launchDate = launch.launchDateUTC {
                    Text("Launch Date: \(Date.dateFormatter(time: launchDate))")
                        .foregroundColor(Color.lightGray)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                }
            }
        }
    }
}

struct LaunchCell_Previews: PreviewProvider {
    static var previews: some View {
        if let launchData = MockManager.shared.launchData?.first {
            LaunchCell(launch: launchData)
        }
    }
}
