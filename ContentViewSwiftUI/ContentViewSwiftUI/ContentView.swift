//
//  ContentView.swift
//  ContentViewSwiftUI
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    init(){
        self.userListViewModel = UserListViewModel(service: WebService())
    }
    
    var body: some View {
        List(userListViewModel.userList,id: \.id){user in
            VStack {
                Text(user.name)
                    .font(.title3)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(user.username)
                    .font(.title2)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(user.email)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundStyle(.green)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
