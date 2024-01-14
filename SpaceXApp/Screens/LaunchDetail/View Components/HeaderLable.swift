//
//  HeaderLable.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

import SwiftUI

struct HeaderLabel: View {
    let title: String
    let size: CGFloat
    let paddingBottom: CGFloat
    let paddingLeading: CGFloat
    let color: Color
    
    init(title: String, size: CGFloat = 18, paddingBottom: CGFloat = 8, paddingLeading: CGFloat = 0, color: Color = .white) {
        self.title = title
        self.size = size
        self.paddingBottom = paddingBottom
        self.paddingLeading = paddingLeading
        self.color = color
    }
    
    var body: some View {
        Text(self.title)
            .foregroundColor(self.color)
            .font(.system(size: self.size, weight: .bold, design: .rounded))
            .padding([.bottom], self.paddingBottom)
            .padding(.leading, self.paddingLeading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//struct HeaderLable_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderLable()
//    }
//}
