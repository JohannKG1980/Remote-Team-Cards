//
//  CollectionsView.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import SwiftUI

struct CollectionsView: View {
    var body: some View {
        VStack(spacing: 16) {
          
            Image("christmas-collection")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .overlay {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(lineWidth: 2)
                        .fill(.white)
                   
                    
                }
                .padding(.horizontal, 36)
                .padding(.top, 56)
            
            HStack(spacing: 18) {
                Image("employe-collection")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 2)
                            .fill(.white)
                       
                        
                    }
                Image("creature-collection")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 2)
                            .fill(.white)
                       
                        
                    }
                    
            }
            HStack(spacing: 18) {
                Image("anime-collection")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 2)
                            .fill(.white)
                       
                        
                    }
                Image("office-collection")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 2)
                            .fill(.white)
                       
                        
                    }
                    
            }
            Text("Do not miss the upcoming Sets! ")
                .font(.title2)
                .fontWeight(.black)
              
           
            Spacer()
            
        }
        .shadow(color: .black, radius: 8, x: 2, y: 6)
        .transition(.scale)
    }
        
}

#Preview {
    CollectionsView()
        .pageBackground()
        .preferredColorScheme(.dark)
}
