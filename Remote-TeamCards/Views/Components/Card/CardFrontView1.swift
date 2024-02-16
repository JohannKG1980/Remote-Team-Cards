//
//  CardFrontView1.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct CardFrontView1: View {
    @State var offset: CGSize = .zero
    var body: some View {
        GeometryReader {
            let size = $0.size
            let imageSize = size.width * 0.7
            VStack {
                ZStack {
                    VStack {
                        Image("cardBG")
                            .resizable()
                            .frame(width: imageSize)
                    }
                    Rectangle()
                        .fill(.badgeBlue.opacity(0.3))
                        .frame(width: imageSize, height: 30)
                        .offset(y: 158)
                    VStack {
                        Image("hero-style")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize)
                            .scaleEffect(1.05)
                            .offset(x: offsetToAngle().degrees * 0.5, y: offsetToAngle(true).degrees * 0.5)
                    }
                    .background {
                        ZStack{
                            
                            Image("vortexbg")
                                .resizable()
                                .blur(radius: 0.9)
                                .frame(height: 290)
                                //.offset(y: -19)
                                .scaleEffect(1.3)
                                .offset(x: offsetToAngle().degrees * -5, y: offsetToAngle(true).degrees * -5)
                                
                          
                            VStack {
                                HStack {
                                 Image("cards")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 8)
                                    Spacer()
                                }
                                .frame(width: imageSize, height: 40)
                                .background(.badgeBlue.opacity(0.7))
                                .padding(.top, 32)
                                Spacer()
                                
                            }
                        }
                        
                    }
                    .clipShape(Rectangle())
                    .offset(y: -50)
                    
                    
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .frame(width: imageSize, height: 6)
                        Capsule()
                            .fill(.white)
                            .frame(width: imageSize * 0.7, height: 30)
                        Text("Hero Cards Style")
                            .foregroundStyle(.cbRed)
                            .font(.title3)
                            .bold()
                    }
                    .offset(y: 85)
                    VStack {
                        Text("Office Hero")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                        
                        Text("The Inspirator")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.ultraLight)
                            .italic()
                            .offset(y: 1)
                        
                    }
                    .offset(y: 135)
                   
                    
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
    CardFrontView1()
}
