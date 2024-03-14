//
//  ContentView.swift
//  ToDoProject
//
//  Created by Ümit Türkmen on 14.03.2024.
//

import SwiftUI
import SwiftData


struct AddToDoScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    
    @State private var name : String = ""
    @State private var priority : Int?
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                TextField("Priority", value: $priority, format: .number)
            }.navigationTitle("Add ToDo")
                .toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                        Button {
                            //Dissmiss action
                            dismiss()
                        } label: {
                            Text("Dismiss")
                        }

                    }
                }
                .toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                        Button {
                            //Save action
                            guard let priority = priority else {return}
                            let toDo = ToDo(name: name, priority: priority)
                            context.insert(toDo)
                            do {
                                try context.save()
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                            
                        } label: {
                            Text("Add")
                        }

                    }
                }
        }
        
    }
}

#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
