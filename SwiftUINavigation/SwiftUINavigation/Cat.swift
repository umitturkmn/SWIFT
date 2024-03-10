//
//  Cat.swift
//  SwiftUINavigation
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import Foundation


struct Cat: Identifiable, Hashable {
    var id = UUID()
    let name : String
    
}

let cats : [Cat] = [Cat(name: "Maviş"), Cat(name: "Duman"),Cat(name: "Salak")]
