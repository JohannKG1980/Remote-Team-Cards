//
//  DashboardView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct DashboardView: View {
    @State var searchText = ""
    var body: some View {
        VStack {
            ZStack {
                TextField("Suchen", text: $searchText)
                    .font(.subheadline)
                    .padding()
                    .background(.white.opacity(0.3))
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 5)
                    .onChange(of: searchText) {
                     
                    }
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .padding(.trailing, 32)
                       
                        .onTapGesture {
                           
                        }
                    
                        
                     
                      
                }
              
            }
            .padding(.horizontal)
            .padding(.top, 32)
            Spacer()
            Text("Browse")
            Spacer()
        }
        .transition(.slide)
    }
}

#Preview {
    DashboardView()
        .pageBackground()
}
