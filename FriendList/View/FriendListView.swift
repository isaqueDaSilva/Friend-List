//
//  FriendListView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct FriendListView: View {
    @StateObject var viewModel = FriendListViewModel()
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Friend List")
            .toolbar {
                ToolbarItem {
                    // Add New Friend Button
                    Button {
                        viewModel.showingAddNewFriend = true
                    } label: {
                        Label("Add New Friend", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $viewModel.showingAddNewFriend, content: {
                NewFriendView()
            })
        }
    }
}

#Preview {
    FriendListView()
}
