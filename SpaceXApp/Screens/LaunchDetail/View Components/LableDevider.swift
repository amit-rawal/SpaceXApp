//
//  LableDevider.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

struct LabelDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 0, color: Color = Color.darkGray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label)
                .foregroundColor(color)
                .font(.system(size: 14, weight: .medium, design: .rounded))
            line
        }
    }

    var line: some View {
        VStack {
            Divider()
                .background(color)
        }
        .padding(horizontalPadding)
    }
}

struct LabelDivider_Previews: PreviewProvider {
    static var previews: some View {
        LabelDivider(label: "Label")
    }
}
