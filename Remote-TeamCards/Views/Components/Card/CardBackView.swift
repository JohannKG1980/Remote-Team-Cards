//
//  CardBackView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct CardBackView: View {
    @State var offset: CGSize = .zero
    var body: some View {
        GeometryReader {
            let size = $0.size
            let imageSize = size.width * 0.7
            VStack {
                ZStack {
                    Image("cardBG")
                                               .resizable()
                                               .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                               .frame(width: imageSize)
                    Image("cards")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .opacity(0.1)
                                       
                }
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .frame(height: 370)
                .overlay {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(lineWidth: 6)
                        .fill(.white)
                    .frame(height: 370)
                    
                }
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
              
            }
            .rotation3DEffect(offsetToAngle(true), axis: (x: -2.5, y: 0, z: 0))
            .rotation3DEffect(offsetToAngle(), axis: (x: 0, y: 2.5, z: 0))
            .scaleEffect(0.9)
            .frame(maxWidth: 390, maxHeight: .infinity)
            .contentShape(Rectangle())
            .gesture(
            DragGesture()
                .onChanged { value in
                    
                    offset = value.translation                 }
                .onEnded { _ in
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.42, blendDuration: 0.42)) {
                        offset = .zero
                    }
                }
            )
        }
    }
    
    // MARK: - Converting Offset into x,y Angles
    func offsetToAngle(_ isVertical: Bool = false) -> Angle {

        let progress = (isVertical ? offset.height : offset.width) / (isVertical ? screenSize.height : screenSize.width)
        return .init(degrees: progress * 10)
    }
    
    // MARK: - Device Screen Size
    var screenSize: CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

#Preview {
    CardBackView()
}
