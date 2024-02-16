//
//  ViewRouter.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

class ViewRouter: ObservableObject {

  @Published var currentPage: Tab = .dashboard
  @Published var returnPage: Tab = .dashboard

}
