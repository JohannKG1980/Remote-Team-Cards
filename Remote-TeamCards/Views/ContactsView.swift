//
//  ContactsView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        VStack {
            Text("Contacts")
        }
        .transition(.push(from: .top))
    }
}

#Preview {
    ContactsView()
}
