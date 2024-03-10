//
//  Dog.swift
//  SwiftUINavigation
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import Foundation

struct Dog: Identifiable, Hashable {
    
    var id = UUID()
    let name : String
    
}

let dogs : [Dog] = [Dog(name: "Çomar"), Dog(name: "Şanslı"),Dog(name: "Yaramaz")]