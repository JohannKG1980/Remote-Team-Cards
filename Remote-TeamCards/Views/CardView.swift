//
//  CardView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct CardView: View {
    let card: CardModel
    @State var flipped: Bool = false
   
    var body: some View {
        VStack {
            
            ZStack {
                CardBackView()
                    .rotation3DEffect(
                        .degrees(flipped ? 0 : -90),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .animation(flipped ? .linear(duration: 0.3).delay(0.36) : .linear(duration: 0.3), value: flipped)
                CardFrontView1()
                    .rotation3DEffect(
                        .degrees(!flipped ? 0 : 90),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .animation(!flipped ? .linear(duration: 0.3).delay(0.36) : .linear(duration: 0.3), value: flipped)
            }
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.3)) {
                   
                        self.flipped.toggle()
                    
                                }
            }
        }
      //  .pageBackground()
        
       
    
    }
}

#Preview {
    CardView(card: CardModel(id: UUID().uuidString, image: "hero-Style", name: "Andreas H.", title: "The Inspirator"))
}
