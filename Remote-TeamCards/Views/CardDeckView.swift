//
//  CardDeckView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct CardDeckView: View {
    
    @State var posiotion = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1...6, id: \.self) { number in
                        CardView(card: CardModel(id: UUID().uuidString, image: "hero-style", name: "Andreas H.", title: "The Inspirator"))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 390)
                            .padding(.horizontal, 20)
                            .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive, axis: .horizontal) { effect, phase in
                                effect
                                    .scaleEffect(1.3 - abs(phase.value))
                                    .opacity(1 - abs(phase.value))
                                    .rotation3DEffect(.degrees(phase.value * 90), axis: (x: 1 , y: 1, z: 1))
                                
                            }
                            .tag(number)
                            .onAppear {
                                posiotion = number
                            }
                    }
                    .frame(maxHeight: 400)
                }
            }
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1...6, id: \.self) { number in
                        CardFrontView1()
                            .frame(width: 390)
                            .scaleEffect(0.3)
                           .padding(.horizontal, -149)
                
                    }
                    .frame(maxHeight: 100)
                }
            }
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .padding(.top)
            
           
        }
     //   .safeAreaPadding(.horizontal)
        .scrollClipDisabled()
       // .scrollTargetBehavior(.viewAligned)
        .pageBackground()
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    CardDeckView()
}
