//
//  ButtonPressActions.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import Foundation
import SwiftUI

struct ButtonPress: ViewModifier {
  var onPress: () -> Void
  var onRelease: () -> Void

  func body(content: Content) -> some View {
    content
      .simultaneousGesture(
        DragGesture(minimumDistance: 0)
          .onChanged { _ in
            onPress()
          }
          .onEnded { _ in
            onRelease()
          }
      )
  }
}

extension View {
  func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
    modifier(
      ButtonPress(
        onPress: {
          onPress()
        },
        onRelease: {
          onRelease()
        }))
  }
}
