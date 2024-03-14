//
//  ToDo.swift
//  ToDoProject
//
//  Created by Ümit Türkmen on 14.03.2024.
//

import Foundation
import SwiftData

@Model
class ToDo {
    var name : String
    var priority : Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
