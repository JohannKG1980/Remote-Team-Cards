//
//  TabNavBarView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct TabNavBarView: View {

  @EnvironmentObject var viewRouter: ViewRouter

  @State var showPopUp = false
  let geometry: GeometryProxy
  @State private var isPressed = false
  var body: some View {

    ZStack {
      if showPopUp {
        PlusMenu(showPopUp: showPopUp, widthAndHeight: geometry.size.width / 7)
          .offset(y: -geometry.size.height / 6 - 7)

      }
        HStack {
            
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 8)
        .background(.ultraThinMaterial)
        .clipShape(TabbarShape(size: geometry.size.width / 6))
      HStack {
        TabBarIcon(assignedPage: .dashboard, width: geometry.size.width / 8,
          height: geometry.size.height / 32, systemIconName: Tab.dashboard.systemImage,
          tabName: Tab.dashboard.rawValue)
        TabBarIcon(assignedPage: .collections, width: geometry.size.width / 8,
          height: geometry.size.height / 32, systemIconName: Tab.collections.systemImage,
          tabName: Tab.collections.rawValue)
        ZStack {
          Circle()
                .foregroundColor(Color("cbRedDarker").opacity(0.8))
            .frame(width: geometry.size.width / 6, height: geometry.size.width / 6)
            .shadow(radius: 8)
            .overlay {
              Circle().stroke(.white.opacity(0.6), lineWidth: 2)
            }
          Circle()
            .fill(
              RadialGradient(
                gradient: Gradient(
                  colors: showPopUp
                    ? [Color("cbRed").opacity(0.6), Color("cbRedDarker").opacity(0.3)]
                    : [Color("cbRed").opacity(0.3), Color("cbRedDarker").opacity(0.6)]),
                center: .center,
                startRadius: 0,
                endRadius: 27
              )
            )
            .frame(width: geometry.size.width / 7, height: geometry.size.width / 7)
            .shadow(radius: 8)
          Image(systemName: "plus")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geometry.size.width / 9 - 11, height: geometry.size.width / 9 - 11)
            .foregroundColor(.white.opacity(0.7))
            .scaleEffect(CGSize(width: showPopUp ? 0.8 : 1.0, height: showPopUp ? 0.8 : 1.0))
            .rotationEffect(Angle(degrees: showPopUp ? 135 : 0))

        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .opacity(isPressed ? 0.6 : 1.0)
        .animation(.bouncy(duration: 0.4, extraBounce: 0.2), value: showPopUp)
        .offset(x: -4, y: -geometry.size.height / 8 / 2)
        .onTapGesture {
          withAnimation {
            showPopUp.toggle()

          }

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
        TabBarIcon(assignedPage: .myDeck, width: geometry.size.width / 8,
          height: geometry.size.height / 32, systemIconName: Tab.myDeck.systemImage,
          tabName: Tab.myDeck.rawValue)
        TabBarIcon(assignedPage: .contacts, width: geometry.size.width / 8,
          height: geometry.size.height / 32, systemIconName: Tab.contacts.systemImage,
          tabName: Tab.contacts.rawValue)
      }
      .frame(width: geometry.size.width, height: geometry.size.height / 8)
      .background(
        Color.cbRedDarker
          .opacity(
            0.1
          )
          .clipShape(TabbarShape(size: geometry.size.width / 6))
          .shadow(radius: 2))
      
    }
  }

}

struct TabbarShape: Shape {
    
    // MARK: - Properties
    
    let size: CGFloat
    
    
    
    // MARK: - Path
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0)) // 1
            path.addLine(to: CGPoint(x: rect.width, y: 0)) // 2
            path.addLine(to: CGPoint(x: rect.width, y: rect.height)) // 3
            path.addLine(to: CGPoint(x: 0, y: rect.height)) // 4

            let center = rect.width / 2

            path.move(to: CGPoint(x: center - size * 0.95, y: 0)) // 5

            let to1 = CGPoint(x: center, y: size * 0.65) // 6
            let control1 = CGPoint(x: center - size * 0.55, y: 0) // 7
            let control2 = CGPoint(x: center - size * 0.6, y: size * 0.7) // 8

            let to2 = CGPoint(x: center + size * 0.95, y: 0) // 9
            let control3 = CGPoint(x: center + size * 0.55, y: size * 0.7) // 10
            let control4 = CGPoint(x: center + size * 0.6, y: 0) // 11

            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
    
}


#Preview {
  GeometryReader { geometry in
    ZStack {
      VStack {
        Spacer()
          TabNavBarView(geometry: geometry)
      }
      .edgesIgnoringSafeArea(.bottom)
      .preferredColorScheme(.dark)

    }
    .environmentObject(ViewRouter())
  }
}
