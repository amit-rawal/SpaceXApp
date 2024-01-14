//
//  LaunchCell.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct LaunchCell: View {
    
    let launch: LaunchModel

//    init(launch: LaunchModel) {
//        self.launch = launch
//    }

    var body: some View {
        
       HStack {
            VStack {
                
                if let imgUrl = launch.links.missionPatchSmall {
                    
                    RemoteImage(url: imgUrl)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                    
//                    AppRemoteImage.init(urlString: imgUrl)
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 40, height: 40, alignment: .center)
//                        .cornerRadius(8)
//                        .foregroundColor(.black)
            
                    
//                    AsyncImage(url: URL(string: imgUrl)) { image in
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40, height: 40, alignment: .center)
//                            .cornerRadius(8)
//                            .foregroundColor(.black)
//                    } placeholder: {
//                        Image("default-icon")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40, height: 40, alignment: .center)
//                            .cornerRadius(8)
//                            .foregroundColor(.black)
//                    }
                    
                    
                } else {
                    VStack {
                        Image("default-icon")
                            .resizable()
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color("light-gray"))
                    .cornerRadius(50)
                }
            }.padding(.trailing, 5)


            VStack(alignment: .leading, spacing: 5) {
                Text(launch.missionName)
                    .foregroundColor(Color.black)
                    .font(.system(size: 16, weight: .bold, design: .rounded))

                if let launchDate = launch.launchDateUTC {
                    Text(Date.dateFormatter(time: launchDate))
                        .foregroundColor(Color("light-gray"))
                        .font(.system(size: 14, weight: .medium, design: .rounded))
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
