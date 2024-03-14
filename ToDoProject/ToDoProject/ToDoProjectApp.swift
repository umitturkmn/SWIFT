//
//  ToDoProjectApp.swift
//  ToDoProject
//
//  Created by Ümit Türkmen on 14.03.2024.
//

import SwiftUI

@main
struct ToDoProjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AddToDoScreen().modelContainer(for: [ToDo.self])
            }
            
        }
    }
}
