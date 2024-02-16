//
//  PlusMenu.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct PlusMenu: View {
    var showPopUp: Bool
    let widthAndHeight: CGFloat
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 30) {
            QuickActionButton(widthAndHeight: widthAndHeight, imageName: "phone", isSystemImage: true) {}
         
            
            QuickActionButton(widthAndHeight: widthAndHeight, imageName: "video", isSystemImage: true) {}
            
            QuickActionButton(widthAndHeight: widthAndHeight, imageName: "message", isSystemImage: true) {}
            
        }
        .transition(showPopUp ? .scale.animation( .snappy(duration: 0.4, extraBounce: 0.2)) : .opacity)
        
        
        
        
    }
    
}

#Preview {
    PlusMenu(showPopUp: true, widthAndHeight: 50)
}
