//
//  Tab.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import Foundation

enum Tab: String, CaseIterable {

  case dashboard = "Browse"
  case collections = "Collections"
  case myDeck = "My Deck"
  case contacts = "Contacts"
    case settings = "Settings"

  var systemImage: String {
    switch self {
    case .dashboard: return "book"
    case .collections: return "sparkles.square.filled.on.square"
    case .myDeck: return "rectangle.portrait.on.rectangle.portrait.angled"
    case .contacts: return "person.3.sequence"
    case .settings: return "gear"
    }

  }

  var index: Int {
    
      Tab.allCases.firstIndex(of: self) ?? 0

  }
}
