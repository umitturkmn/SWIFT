//
//  NetworkService.swift
//  ContentViewSwiftUI
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import Foundation


protocol NetworkService {
    
    func download(_ resource: String) async throws -> [User]
    var type : String{get}
}
