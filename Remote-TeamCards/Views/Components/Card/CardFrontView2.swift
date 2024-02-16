//
//  CardFrontView2.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI
import CoreMotion

struct CardFrontView2: View {
    let card: CardModel
    @State var offset: CGSize = .zero
    private var motionManager = CMMotionManager()
    @State private var initialRoll: Double? = nil
    @State private var initialPitch: Double? = nil
    @State private var roll: Double = 0.0
    @State private var pitch: Double = 0.0
    private let smoothingFactor: Double = 2.8
    
    @State private var shimmerPosition: CGFloat = -1 // Startposition des Glanzeffekts
    init(card: CardModel) {
        self.card = card
    }
    
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
                        Image(card.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize)
                            .scaleEffect(1.05)
                        //     .offset(x: offsetToAngle().degrees * 2, y: offsetToAngle(true).degrees * 2)
                            .offset(x: offsetToAngle(false, angle: roll).degrees * -0.5, y: offsetToAngle(true, angle: pitch).degrees * 0.5)
                    }
                    .background {
                        ZStack{
                            
                            Image("vortexbg")
                                .resizable()
                                .blur(radius: 0.9)
                                .frame(height: 290)
                            //.offset(y: -19)
                                .scaleEffect(1.3)
                                .offset(x: offsetToAngle(false, angle: roll).degrees * -1.5, y: offsetToAngle(true, angle: pitch).degrees * -2.5)
                            
                            
                            
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
                        Text(card.name)
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                        
                        Text(card.title)
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
//                    ShimmerEffectView(angle: calculateShimmerAngle(), offsetX: offsetToAngle(false, angle: roll).degrees * -35, offsetY: offsetToAngle(true, angle: pitch).degrees * 60)
//                                       .animation(.linear, value: roll)
//                                       .animation(.linear, value: pitch)
//                                       .mask {
//                                           RoundedRectangle(cornerRadius: 25.0)
//                                               .frame(width: imageSize, height: 370)
//                                       }
                }
                .shadow(color: .black, radius: 8, x: 2, y: 6)
           
            }
            .rotation3DEffect(self.offsetToAngle(true, angle: pitch), axis: (x: -0.5, y: 0, z: 0))
            .rotation3DEffect(self.offsetToAngle(false, angle: roll), axis: (x: 0, y: 0.5, z: 0))
            .scaleEffect(0.9)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                self.startMotionUpdates()
            }
        }
    }
    
    
    // Aktualisierte Methode mit Glättung
    private func updateMotion(currentRoll: Double, currentPitch: Double) {
        // Glättung anwenden
        let smoothedRoll = (roll * smoothingFactor) + (currentRoll * (1 - smoothingFactor))
        let smoothedPitch = (pitch * smoothingFactor) + (currentPitch * (1 - smoothingFactor))
        
        // Update state variables with smoothed values
        self.roll = smoothedRoll
        self.pitch = smoothedPitch
    }
    
    private func calculateShimmerAngle() -> Double {
         // Beispielhafte Berechnung des Winkels basierend auf Roll- und Pitch-Werten
         // Passt den Winkel des Schimmereffekts an die Neigung der Karte an
         return roll * 10 + pitch * 10
     }
    
    private func startMotionUpdates() {
        
        
        guard motionManager.isDeviceMotionAvailable else { return }

        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: .main) { [self] (data, error) in
            guard let motion = data else { return }
            
            // Initialwerte speichern, falls noch nicht gesetzt
            if initialRoll == nil {
                initialRoll = motion.attitude.roll
            }
            if initialPitch == nil {
                initialPitch = motion.attitude.pitch
            }
            
            // Berechnung der relativen Neigung
            let relativeRoll = motion.attitude.roll - initialRoll!
            let relativePitch = motion.attitude.pitch - initialPitch!
            
            // Begrenzung der relativen Roll- und Pitch-Werte
            let maxRoll: Double = .pi / 15 // Maximal 30 Grad
            let maxPitch: Double = .pi / 25 // Maximal 30 Grad

            // Anwenden der Begrenzung
            let currentRoll = min(max(relativeRoll, -maxRoll), maxRoll)
            let currentPitch = min(max(relativePitch, -maxPitch), maxPitch)
            
            // Update state variables based on limited relative device motion
            self.roll = currentRoll
            self.pitch = currentPitch
            
            // Anwendung der Glättung
                 updateMotion(currentRoll: currentRoll, currentPitch: currentPitch)
        }
    }
    
    
    // Angepasste offsetToAngle Funktion, die einen Winkel basierend auf Bewegungsdaten zurückgibt
    func offsetToAngle(_ isVertical: Bool = false, angle: Double) -> Angle {
        // Konvertieren von Radiant in Grad und Anpassen des Winkels
        let angleDegrees = angle * (180 / .pi) // Umrechnung von Radiant in Grad
        let adjustedAngle = isVertical ? angleDegrees * 0.5 : angleDegrees * 0.5 // Anpassen der Empfindlichkeit
        return .degrees(adjustedAngle)
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


struct ShimmerEffectView: View {
    var angle: Double // Winkel des Schimmereffekts
    var offsetX: Double
    var offsetY: Double
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(0.35), .clear]), startPoint: .leading, endPoint: .trailing)
            .frame(width: 200, height: 1270)
            .mask(RoundedRectangle(cornerRadius: 25.0))
            .rotationEffect(.degrees(angle * 5 + -45))
            .offset(x: offsetX, y: offsetY)
    }
    
}

#Preview {
    CardFrontView2(card: CardModel(id: UUID().uuidString, image: "hero-style", name: "Office Hero", title: "The Inspirator"))
}
