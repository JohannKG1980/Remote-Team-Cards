//
//  TabBarIcon.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct TabBarIcon: View {

  @EnvironmentObject var viewRouter: ViewRouter
  let assignedPage: Tab
  @State private var isPressed = false

  let width, height: CGFloat
  let systemIconName, tabName: String

  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: systemIconName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: width, height: height)
        .padding(.top, 16)
      Text(tabName)
        .font(.system(size: 10))

      Spacer()
    }
    .scaleEffect(isPressed ? 0.95 : 1.0)
    .opacity(isPressed ? 0.6 : 1.0)
    .padding(.horizontal, 8)
    .onTapGesture {
        withAnimation(.easeInOut(duration: 0.3)) {
        viewRouter.currentPage = assignedPage
      }
    }
    .pressEvents {
      // On press
      withAnimation(.easeInOut(duration: 0.1)) {
        isPressed = true
      }
    } onRelease: {
      withAnimation {
        isPressed = false
      }
    }

    .foregroundColor(viewRouter.currentPage == assignedPage ? Color("cbRed") : .gray)
    .animation(.default, value: viewRouter.currentPage)
  }
}

#Preview {
  TabBarIcon(assignedPage: .dashboard, width: 45, height: 45,
    systemIconName: "house.lodge", tabName: "Dasboard")
  .environmentObject(ViewRouter())
}
