//
//  QuickActionButton.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct QuickActionButton: View {
    
    let widthAndHeight: CGFloat
    let imageName: String
    let isSystemImage: Bool
    var action: () -> Void
    @State private var isPressed = false
    
    init(widthAndHeight: CGFloat, imageName: String, isSystemImage: Bool = true, action: @escaping (() -> Void)) {
        self.widthAndHeight = widthAndHeight
        self.imageName = imageName
        self.isSystemImage = isSystemImage
        self.action = action
    }
    
    var body: some View {
        ZStack {
            
            Circle()
                .foregroundColor(isPressed ? .cbRed.opacity(0.6) : .cbRedDarker.opacity(0.4))
                .frame(width: widthAndHeight + 5, height: widthAndHeight + 5)
                .overlay {
                    Circle().stroke(.white, lineWidth: 9)
                }
            Circle()
                .foregroundColor(.clear)
                .frame(width: widthAndHeight + 3, height: widthAndHeight + 3)
                .overlay {
                    Circle().stroke(Color("cbRedDarker").opacity(0.7), lineWidth: 7)
                }
            if isSystemImage {
                
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
            } else {
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
            }
            
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .opacity(isPressed ? 0.6 : 1.0)
        .shadow(color: .black.opacity(0.5), radius: 3, y: 6)
        .onTapGesture {
            action()
        }
        .pressEvents {
            
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = true
            }
        } onRelease: {
            withAnimation {
                isPressed = false
            }
        }
        
    }
}

#Preview {
    QuickActionButton(widthAndHeight: 50, imageName: "briefcase", isSystemImage: true) {}
}

