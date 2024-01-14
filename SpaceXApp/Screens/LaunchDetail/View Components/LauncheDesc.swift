//
//  LaunchDesc.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct LaunchDesc: View {
    
    let launch: LaunchModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderLabel(title: "Information")

            VStack(alignment: .center, spacing: 10) {
                
                
                if launch.launchSuccess != nil {
                    RowData(rowType: .bool, label: "Success", value: String(launch.launchSuccess ?? false))
                } else {
                    RowData(rowType: .bool, label: "Success", value: "")
                }
                    
                if let link = launch.links.articleLink {
                    RowData(rowType: .link, label: "Article", value: link)
                }
                if let link = launch.links.youtubeID {
                    RowData(rowType: .link, label: "Youtube", value: link)
                }
                if let link = launch.links.wikipedia {
                    RowData(rowType: .link, label: "Wikipedia", value: link)
                }
                if let link = launch.links.presskit {
                    RowData(rowType: .link, label: "Press kit", value: link)
                }
                
                if let details = launch.details {
                    LabelDivider(label: "Details")
                
                    VStack(alignment: .leading) {
                        Text(details)
                            .foregroundColor(Color.lightGray)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }

            }
            .blueBox()
        }
    }
}

struct LaunchDesc_Previews: PreviewProvider {
    static var previews: some View {
        if let launchData = MockManager.shared.launchData?.first {
            LaunchDesc(launch: launchData)
        }
    }
}
