//
//  ContentView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var isPressed = false
    private var safeIgnoreType: Edge.Set {
        if viewRouter.currentPage == .settings {
            return .all
        } else {
            return .bottom
        }
    }
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                
               
                    
                   
                    
                    switch viewRouter.currentPage {
                    case .dashboard:
                        DashboardView()
                        
                    case .collections:
                       CollectionsView()
                        
                    case .myDeck:
                        CardDeckView()
                        
                    case .contacts:
                        ContactsView()
                        
                    case .settings:
                        DashboardView()

                    }
                VStack {
                    if viewRouter.currentPage != .settings {
                        Spacer()
                        TabNavBarView(geometry: geometry)
                            
                    }
                }
                .edgesIgnoringSafeArea(safeIgnoreType)
               
                    if viewRouter.currentPage != .settings {
                        HStack {
                            Image("cards")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                            Text("Team Card Collector")
                        }
                        .position(
                            x: geometry.frame(in: .global).minX + 120 , y: geometry.frame(in: .global).minY + 20)
                        .ignoresSafeArea()
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .rotationEffect(Angle(degrees: isPressed ? 360 : 0))
                            .scaleEffect(isPressed ? 0.80 : 1.0)
                            .opacity(isPressed ? 0.6 : 1.0)
                            .position(
                                x: geometry.frame(in: .global).maxX - 40, y: geometry.frame(in: .global).minY + 20
                            )
                            .shadow(radius: 5)
                            .ignoresSafeArea()

                            .onTapGesture {
                                withAnimation {
//                                    viewRouter.returnPage = viewRouter.currentPage
//                                    viewRouter.currentPage = .settings
                                }
                            }
                            .pressEvents {
                                
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    isPressed = true
                                }
                            } onRelease: {
                                withAnimation {
                                    isPressed = false
                                }
                            }
                    }
        
                
            }
            .offset(x: -16)
            .pageBackground()
            .preferredColorScheme(.dark)
            
        }
    }
    
}


#Preview {
    MainAppView()
        .environmentObject(ViewRouter())
}
