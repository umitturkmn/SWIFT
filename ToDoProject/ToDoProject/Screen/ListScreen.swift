//
//  ListView.swift
//  ToDoProject
//
//  Created by Ümit Türkmen on 14.03.2024.
//

import SwiftUI

struct ListScreen: View {
    let toDos: [ToDo]
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                HStack{
                    Text(toDo.name)
                    Spacer()
                    Text(toDo.priority.description)
                }
                
            }
        }
    }
}


#Preview {
    ListScreen(toDos: [ToDo(name: "Test", priority: 123)])
        
        
}

