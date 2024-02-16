//
//  Remote_TeamCardsApp.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

@main
struct Remote_TeamCardsApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
           MainAppView()
        }
        .environmentObject(viewRouter)
    }
}
