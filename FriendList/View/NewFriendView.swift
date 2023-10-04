//
//  NewFriendView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct NewFriendView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NewFriendViewModel
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Spacer()
                    
                    if viewModel.image == nil {
                        Button(action: {
                            viewModel.showingImagePicker = true
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(.secondary)
                                    .cornerRadius(10)
                                
                                Image(systemName: "square.and.arrow.down")
                                    .font(.system(size: 40))
                            }
                        })
                        .frame(width: 250, height: 250)
                    } else {
                        viewModel.image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                    
                    Spacer()
                }
                
                Section {
                    TextField("Insert Name:", text: $viewModel.name)
                    DatePicker("Date:", selection: $viewModel.date, in: ...Date.now, displayedComponents: .date)
                }
                
                Section {
                    HStack {
                        TextField("Insert Place:", text: $viewModel.placeName)
                            .onChange(of: viewModel.placeName, perform: { _ in
                                if viewModel.placeName.count > 0 {
                                    viewModel.search()
                                } else {
                                    viewModel.places = []
                                }
                            })
                        
                        Button {
                            viewModel.getCurrentLocationName()
                        } label: {
                            Image(systemName: "location.circle")
                        }
                    }
                    
                    if !viewModel.places.isEmpty {
                        ForEach(viewModel.places) { place in
                            VStack(alignment: .leading) {
                                Text(place.name)
                                    .font(.title3)
                                Text(place.adress)
                                    .font(.callout)
                            }
                            .onTapGesture {
                                viewModel.placeName = place.name
                            }
                        }
                    }
                }
            }
            .navigationTitle("New Friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("OK") {
                        viewModel.addNewFriend()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    })
                }
            }
            .sheet(isPresented: $viewModel.showingImagePicker, content: {
                ImagePicker(image: $viewModel.inputImage)
                    .onChange(of: viewModel.inputImage, perform: { _ in
                        viewModel.loadImage()
                    })
            })
        }
    }
    
    init(onSave: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: NewFriendViewModel(onSave: onSave))
    }
}
