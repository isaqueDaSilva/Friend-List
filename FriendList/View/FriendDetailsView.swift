//
//  FriendDetailsView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import MapKit
import SwiftUI

struct FriendDetailsView: View {
    @StateObject var viewModel: FriendDetailsViewModel
    var body: some View {
        List {
            HStack {
                Spacer()
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                }
                Spacer()
            }
            
            Section {
                DetailView(title: "Date:", description: viewModel.dateFormatter())
            }
            
            Section {
                DetailView(title: "Place:", description: viewModel.place)
                VStack {
                    Map(coordinateRegion: $viewModel.region, annotationItems: [viewModel.friend]) { friend in
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: friend.latitude, longitude: friend.longitude)) {
                            
                            if let image = viewModel.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                .frame(height: 300)
            }
        }
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
