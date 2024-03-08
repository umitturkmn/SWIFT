//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by Ümit Türkmen on 8.03.2024.
//

import Foundation

struct Welcome: Identifiable, Codable {
    let id = UUID()
    let type: String
    let value: [Value]
}

struct Value: Identifiable, Codable {
    
    let id: Int
    let joke: String
    let categories: [String]
}



