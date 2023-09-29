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
                Section {
                    ForEach(viewModel.friends) { friend in
                        NavigationLink {
                            FriendDetailsView()
                        } label: {
                            HStack {
                                // Display Image
                                
                                // Display Name
                                Text(friend.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Friend List")
            .toolbar {
                // Add New Friend Button
                ToolbarItem {
                    Button {
                        viewModel.showingAddNewFriend = true
                    } label: {
                        Label("Add New Friend", systemImage: "plus")
                    }
                }
                
                // Edit Button
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            // Display NewFriendView
            .sheet(isPresented: $viewModel.showingAddNewFriend, content: {
                NewFriendView()
            })
        }
    }
}

#Preview {
    FriendListView()
}
