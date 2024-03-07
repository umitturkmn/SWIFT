//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Ümit Türkmen on 7.03.2024.
//

import Foundation

struct CryptoCurrency : Decodable, Identifiable {
    let currency : String
    let price : String
    let id = UUID()
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
