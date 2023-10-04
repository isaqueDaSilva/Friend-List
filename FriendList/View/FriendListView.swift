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
                            FriendDetailsView(friend: friend, onSave: { viewModel.getFriendList() })
                        } label: {
                            HStack {
                                // Display Image
                                VStack {
                                    if let image = friend.friendPhoto {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 48, height: 48)
                                            .clipped()
                                            .cornerRadius(50)
                                    }
                                }
                                // Display Name
                                Text(friend.unwrappedName)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.delete)
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
                NewFriendView(onSave: { viewModel.getFriendList() })
            })
        }
    }
}
