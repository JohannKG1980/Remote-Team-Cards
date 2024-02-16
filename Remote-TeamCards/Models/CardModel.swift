//
//  CardModel.swift
//  Remote-TeamCards
//
//  Created by Johann Kucharczyk-Gentsch on 16.02.24.
//

import Foundation


struct CardModel: Codable, Identifiable {
    
    var id: String
    var image: String
    var name: String
    var title: String
    
    // MARK: - Backside -
    
    var cardScore: Int?
    var motto: String?
    
}
