//
//  FriendDetailsView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct FriendDetailsView: View {
    @StateObject var viewModel: FriendDetailsViewModel
    var body: some View {
        List {
            VStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
            Section {
                DetailView(title: "Place", description: viewModel.place)
                DetailView(title: "Date", description: viewModel.dateFormatter())
            }
        }
        .listStyle(.plain)
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                viewModel.showingDeleteAlert = true
            } label: {
                Label("Delete friend", systemImage: "trash")
            }
        }
        .alert("Are you sure you want to delete your friend?", isPresented: $viewModel.showingDeleteAlert) {
            Button("Delete", role: .destructive) {
                viewModel.delete()
            }
            
            Button("Cancel", role: .cancel) { }
        }
    }
    
    init(friend: Friend, onSave: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: FriendDetailsViewModel(friend: friend, onSave: onSave))
    }
}
