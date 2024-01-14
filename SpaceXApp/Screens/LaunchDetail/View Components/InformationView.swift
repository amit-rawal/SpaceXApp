//
//  InformationView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct InformationView: View {
    
    let launch: LaunchModel
    private let frameSize = CGFloat(50)
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                HStack {
                    if let imgUrl = launch.links.missionPatchSmall {
                        RemoteImage(url: imgUrl)
                            .frame(width: frameSize, height: frameSize, alignment: .center)
                            .foregroundColor(.black)
                    } else {
                        VStack {
                            Image("default-icon")
                                .resizable()
                        }
                        .frame(width: frameSize, height: frameSize, alignment: .center)
                        .background(Color.lightGray)
                        .cornerRadius(50)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(launch.missionName)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    if let launchDate = launch.launchDateUTC {
                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .foregroundColor(Color.lightGray)
                            
                            Text(Date.dateFormatter(time: launchDate))
                                .foregroundColor(Color.lightGray)
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                        }
                    }
                }
                .padding(.leading, 10)
                
                Spacer()
            }
        }
        .blueBox()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        if let launchData = MockManager.shared.launchData?.first {
            InformationView(launch: launchData)
        }
    }
}
