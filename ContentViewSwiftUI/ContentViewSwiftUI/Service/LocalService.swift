//
//  LocalService.swift
//  ContentViewSwiftUI
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import Foundation

class LocalService: NetworkService {
    var type: String = "LocalService"
    
    
    
    func download(_ resource: String) async throws -> [User]{
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("dsagsdag")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
