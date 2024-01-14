//
//  CellImageView.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct CellImageView: View {
    let launch: LaunchModel
    var body: some View {
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
    }
}

struct CellImageView_Previews: PreviewProvider {
    static var previews: some View {
        if let launchData = MockManager.shared.launchData?.first {
            CellImageView(launch: launchData)
        }
    }
}
