//
//  ImageViewDetail.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct ImageViewDetail: View {
    
    let launch: LaunchModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let imgUrl = launch.links.missionPatchSmall {
                RemoteImage(url: imgUrl)
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(height: 260)
        .blueBox()
    }
}

struct ImageViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        if let launchData = MockManager.shared.launchData?.first {
            ImageViewDetail(launch: launchData)
        }
    }
}
