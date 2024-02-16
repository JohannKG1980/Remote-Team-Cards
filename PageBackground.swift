//
//  PageBackground.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct PageBackground: ViewModifier {
    
    func  body(content: Content) -> some View {
        ZStack {
            Image("appBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaleEffect(1.1)
                .blur(radius: 3.9)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            content
        }
    }
}

extension View {
    func pageBackground() -> some View {
        modifier(PageBackground())
    }
}
