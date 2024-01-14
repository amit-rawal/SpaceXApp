//
//  View+Ext.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import SwiftUI

// View modifier used in detail view

struct BlueBox: ViewModifier {
    func body(content: Content) -> some View {
        
        VStack(alignment: .leading) {
            content
                .padding([.top, .bottom], 15)
                .padding([.leading, .trailing], 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.midBlue)
        .cornerRadius(5)
    }
    static func divider() -> some View {
        VStack{}
            .frame(maxWidth: .infinity, minHeight: 0.5)
            .background(Color.darkGray)
    }
}

extension View {
    func blueBox() -> some View {
        self.modifier(BlueBox())
    }
}
